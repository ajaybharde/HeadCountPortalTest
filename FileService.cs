using Headcount.DTO;
using Headcount.ServiceInterface.Utilities;
using Headcount.ServiceModel.Types;
using ServiceStack.Common.Web;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Script.Serialization;
using UkAppsUtils.Authorisation;
using UkAppsUtils.Config;
using UkAppsUtils.Logging;
using IO = System.IO;


namespace Headcount.ServiceInterface
{

    #region DTO

    #endregion

    #region Routes

    [Route("/file/{fileid}")]
    public class FileView
    {
        public int FileId { get; set; }
    }



    [Route("/file/upload", "POST")]
    public class FileUploadPost
    {

    }


    [Route("/file/{fileid}/delete")]
    public class FileDelete 
    {
        public int FileId { get; set; }

    }
    #endregion

    #region Service
     [PermittedRoles(RoleDTO.Security_Team_Role, 
         RoleDTO.Facilities_Admin_Role, 
         RoleDTO.System_Admin_Role, 
         RoleDTO.Administrator_Role, 
         RoleDTO.Radonly_User_Role)]
    public class FileService : Service
    {

        //
        public FileService()
        {

        }


        public object Get(FileView r)
        {
            try
            {


                var docFile = Db.First<UploadFileDetail>(o => o.Id == r.FileId);

                byte[] content = FileHelper.Decompress(docFile.FileData);

                var res = new HttpResult(content, docFile.ContentType);
                res.Headers[HttpHeaders.ContentDisposition] = "attachment; filename=" + docFile.Name_File;
                return res;


            }
            catch
            {
                HttpResult res = new HttpResult() { StatusCode = HttpStatusCode.Redirect, Headers = { { HttpHeaders.Location, ConfigHelper.AppUrl + "Index.html" } } };
                return res;
            }
        }


        // Uploads a new file
        public UploadFileDetail Post(FileUploadPost p)
        {


            try
            {
                // If no file is being uploaded (should not be possible)
                if (RequestContext.Files.Count() == 0)
                    throw new ArgumentException("File to upload is required");

                // Retrieve the file delivered from the client
                var uploadedFile = RequestContext.Files[0];

                // Check the file is not too big
                if (uploadedFile.ContentLength >= 26214400)
                {
                    Response.Write("TOOBIG");
                }
                else
                {
                    // Get the uploaded file
                    string fileName = IO.Path.GetFileName(uploadedFile.FileName);
                    string fileExt = uploadedFile.FileName.Split('.').Last();

                    // Get the file as a compressed byte array
                    IO.MemoryStream ms = new IO.MemoryStream();
                    uploadedFile.WriteTo(ms);
                    byte[] fileContent = FileHelper.Compress(ms);
                    ms.Position = 0;
                    var fileDetails = new UploadFileDetail
                    {
                        ContentType = uploadedFile.ContentType,
                        Name_File = fileName,
                        DisplayName = fileName,
                        Extension = fileExt,
                        FileData = fileContent,
                        CreatedBy = WindowsHelper.WindowsUserName,
                        FileSize = uploadedFile.ContentLength,
                        CreatedDate = DateTime.Now


                    };
                    ms.Dispose();

                    return fileDetails;
                }

                return null;
            }
            catch (Exception ex)
            {
                ErrorLogger.InsertError("[upload file]", ex);
                throw new Exception("An error occurred uploading the template file: " + ex.Message);
            }
        }

        public void Delete(FileDelete r)
        {
            try
            {


                Db.DeleteById<UploadFileDetail>(r.FileId);
                Response.Write("Success");

            }
            catch (Exception ex)
            {
                Response.Write("Error");
                ErrorLogger.InsertError(ex);

            }

        }

        private int FileUpload(IO.MemoryStream ms, string fileName, string contentType)
        {
            try
            {

                // Compress the original file
                ms.Position = 0;
                byte[] fileContent = FileHelper.Compress(ms);

                SqlConnection conn = new SqlConnection(ConfigHelper.COPConnStr);

                // Sql command
                SqlCommand cmd = new SqlCommand("sp_InsertFile", conn);
                //.CommandTimeout = 120;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //cmd.CommandText =;

                // Add parameters
                SqlParameter paramFileName = new SqlParameter("@fileName", SqlDbType.NVarChar, 200);
                paramFileName.Value = fileName;
                cmd.Parameters.Add(paramFileName);
                SqlParameter paramMimeType = new SqlParameter("@mimeType", SqlDbType.NVarChar, 200);
                paramMimeType.Value = contentType;
                cmd.Parameters.Add(paramMimeType);
                SqlParameter paramFileData = new SqlParameter("@fileData", SqlDbType.VarBinary, fileContent.Length);
                paramFileData.Value = fileContent;
                cmd.Parameters.Add(paramFileData);
                //SqlParameter paramDocumentVersionId = new SqlParameter("@documentVersionId", SqlDbType.Int);
                //paramDocumentVersionId.Value = documentVersionFile.DocumentVersionId;
                //cmd.Parameters.Add(paramDocumentVersionId);
                //SqlParameter paramDocumentTypeId = new SqlParameter("@documentTypeId", SqlDbType.Int);
                //paramDocumentTypeId.Value = documentVersionFile.DocumentFileTypeId;
                //cmd.Parameters.Add(paramDocumentTypeId);
                SqlParameter userId = new SqlParameter("@userId", SqlDbType.NVarChar, 10);
                userId.Value = WindowsHelper.WindowsUserName;
                cmd.Parameters.Add(userId);

                // Store the file
                conn.Open();
                int fileId = 0;
                fileId = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();

                // Tidy up
                fileContent = null;
                ms.Dispose();

                return fileId;
            }
            catch (Exception ex)
            {
                ErrorLogger.InsertError("File Upload", ex);
                return 0;
            }
        }

        #region Helpers
        public static void OLDLoadFileContent(IDbConnection Db, int fileId, byte[] fileContent)
        {

            //
            var cmd = Db.CreateCommand();
            cmd.CommandTimeout = 240;
            cmd.CommandText = "UPDATE [DocumentFile] SET [FileData].WRITE(@data, @offset, @len) WHERE [Id]=@id";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter dataParam = new SqlParameter("@data", SqlDbType.VarBinary);
            cmd.Parameters.Add(dataParam);

            SqlParameter offsetParam = new SqlParameter("@offset", SqlDbType.BigInt);
            cmd.Parameters.Add(offsetParam);

            SqlParameter lengthParam = new SqlParameter("@len", SqlDbType.BigInt);
            cmd.Parameters.Add(lengthParam);

            SqlParameter idParam = new SqlParameter("@id", SqlDbType.VarChar);
            cmd.Parameters.Add(idParam);
            idParam.Value = fileId;

            using (IO.MemoryStream ms2 = new IO.MemoryStream(fileContent))
            {
                ms2.Position = 0;

                byte[] buffer = new byte[2090400]; //chunk sizes that are multiples of 8040 bytes.
                int read = 0;
                int offset = 0;

                //int test = ms.Read(buffer, 0, buffer.Length);

                while ((read = ms2.Read(buffer, 0, buffer.Length)) > 0)
                {
                    dataParam.Value = buffer;
                    offsetParam.Value = offset;
                    lengthParam.Value = read;

                    cmd.ExecuteNonQuery();

                    offset += read;
                }
                buffer = null;
                ms2.Dispose();
            }
        }

        public static void LoadFileContentORIG(IDbConnection Db, int fileId, byte[] fileContent)
        {

            //
            var cmd = Db.CreateCommand();
            cmd.CommandTimeout = 240;
            cmd.CommandText = "UPDATE [UploadFileDetail] SET [FileData].WRITE(@data, @offset, @len) WHERE [Id]=@id";

            SqlParameter dataParam = new SqlParameter("@data", SqlDbType.VarBinary);
            cmd.Parameters.Add(dataParam);

            SqlParameter offsetParam = new SqlParameter("@offset", SqlDbType.BigInt);
            cmd.Parameters.Add(offsetParam);

            SqlParameter lengthParam = new SqlParameter("@len", SqlDbType.BigInt);
            cmd.Parameters.Add(lengthParam);

            SqlParameter idParam = new SqlParameter("@id", SqlDbType.VarChar);
            cmd.Parameters.Add(idParam);
            idParam.Value = fileId;

            using (IO.MemoryStream ms2 = new IO.MemoryStream(fileContent))
            {
                ms2.Position = 0;

                byte[] buffer = new byte[2090400]; //chunk sizes that are multiples of 8040 bytes.
                int read = 0;
                int offset = 0;

                //int test = ms.Read(buffer, 0, buffer.Length);

                while ((read = ms2.Read(buffer, 0, buffer.Length)) > 0)
                {
                    dataParam.Value = buffer;
                    offsetParam.Value = offset;
                    lengthParam.Value = read;

                    cmd.ExecuteNonQuery();

                    offset += read;
                }
                buffer = null;
                ms2.Dispose();
            }
        }
        //

        #endregion
    }

    #endregion

}