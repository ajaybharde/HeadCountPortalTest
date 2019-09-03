using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceModel.Types;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using UkAppsUtils.Authorisation;
using UkAppsUtils.Logging;
using Headcount.DTO;
using Headcount.ServiceModel.Types;
using ServiceStack.Common.Web;
using ServiceStack.ServiceInterface.Auth;
using System.Data;
using System.Data.SqlClient;
using Headcount.ServiceInterface.Utilities;

namespace Headcount.ServiceInterface
{
    #region dto

    #endregion

    #region route


    [Route("/GetFile", "GET")]
    public class FileDetail : IReturn<object>
    {
        public UploadFileDetail uploadedFile { get; set; }
    }
    [Route("/GetFile/{id}", "GET")]
    public class FileDetailById : IReturn<object>
    {
        public int? Id { get; set; }

    }


    [Route("/HeadCount", "GET")]
    [Route("/HeadCount/", "GET")]
    [Route("/HeadCount/{id}", "GET")]
    public class HeadCountList : IReturn<HeadCountDTO>
    {
        public int? Id { get; set; }
    }

    [Route("/HeadCountCheck", "GET")]
    public class CheckHeadcount : IReturn<bool>
    {
        public string Forename { get; set; }
        public string Surname { get; set; }
        public int HeadcountId { get; set; }
    }

    [Route("/HeadCount/SapPersonnelNoCheck", "GET")]
    public class CheckSapPersonnelNo : IReturn<bool>
    {

        public string Personnel_No { get; set; }
        public int headcountId { get; set; }
    }
    [Route("/HeadCount/SapPositionIDCheck", "GET")]
    public class CheckSapPositionID : IReturn<bool>
    {

        public string SAP_PositionID { get; set; }
        public int headcountId { get; set; }
    }
    [Route("/HeadCount/LocalPositionCodeCheck", "GET")]
    public class CheckLocalPositionCode : IReturn<bool>
    {

        public string LocalPositionCode { get; set; }
        public int headcountId { get; set; }
    }
    
    [Route("/HeadCount/HeadCountlookups", "GET")]
    public class HeadCountLookupsReq : IReturn<HeadCountDTO>
    {


    }

    [Route("/HeadCount/all", "POST")]
    public class HeadCountnallList : IReturn<List<HeadCount>>
    {


    }

    [Route("/HeadCount", "POST")]
    public class HeadCountSave : IReturn<HeadCountDTO>
    {
        public HeadCount Headcount { get; set; }
        public List<UploadFileDetail> UploadFileDetailList { get; set; }

    }
    [Route("/HeadCount", "PUT")]
    public class HeadCountUpdate : IReturn<HeadCountDTO>
    {
        public HeadCount Headcount { get; set; }
        public List<UploadFileDetail> UploadFileDetailList { get; set; }

    }
    #endregion

    [PermittedRoles(RoleDTO.Security_Team_Role,
        RoleDTO.Facilities_Admin_Role,
        RoleDTO.System_Admin_Role,
        RoleDTO.Administrator_Role,
        RoleDTO.Radonly_User_Role)]
    public class HeadCountService : Service
    {

        public bool Get(CheckHeadcount data)
        {
            var result = Db.Select<HeadCount>(a => a.Forename == data.Forename && a.Surname == data.Surname).ToList();
            var headCountPrev = Db.Select<HeadCount>(a => a.Id == data.HeadcountId).FirstOrDefault();
            if (data.HeadcountId != 0 && data.Forename == headCountPrev.Forename && data.Surname == headCountPrev.Surname)
            {
                return false;
            }
            return result.Count > 0;

        }

        public bool Get(CheckSapPersonnelNo value)
        {
            var result = Db.Select<HeadCount>(a => a.Personnel_NO == value.Personnel_No).ToList();
            var headCountPrev = Db.Select<HeadCount>(a => a.Id == value.headcountId).FirstOrDefault();
            var headcount = result.FirstOrDefault();

            if (headCountPrev != null && value.Personnel_No == headCountPrev.Personnel_NO)
            {
                return false;
            }
            return result.Count > 0;

        }

        public bool Get(CheckSapPositionID value)
        {
            var result = Db.Select<HeadCount>(a => a.SAP_PositionID == value.SAP_PositionID).ToList();
            var headCountPrev = Db.Select<HeadCount>(a => a.Id == value.headcountId).FirstOrDefault();
            var headcount = result.FirstOrDefault();

            if (headCountPrev != null && value.SAP_PositionID == headCountPrev.SAP_PositionID)
            {
                return false;
            }
            return result.Count > 0;

        }
        public bool Get(CheckLocalPositionCode value)
        {
            var result = Db.Select<HeadCount>(a => a.LocalPositionCode == value.LocalPositionCode).ToList();
            var headCountPrev = Db.Select<HeadCount>(a => a.Id == value.headcountId).FirstOrDefault();
            var headcount = result.FirstOrDefault();

            if (headCountPrev != null && value.LocalPositionCode == headCountPrev.LocalPositionCode)
            {
                return false;
            }
            return result.Count > 0;

        }

        public object Get(FileDetail request)
        {
            var uploadfileDetails = Db.Select<UploadFileDetail>().Where(f =>
                (f.DisplayName == request.uploadedFile.DisplayName) && (f.Id == request.uploadedFile.Id)).FirstOrDefault();
            HttpResult res = new HttpResult(uploadfileDetails.FileData, uploadfileDetails.ContentType);
            res.Headers[HttpHeaders.ContentDisposition] = "attachment; filename=" + uploadfileDetails.DisplayName;
            return res;
        }


        public object Get(FileDetailById request)
        {
            var uploadfileDetails = Db.Select<UploadFileDetail>().Where(f => (f.Id == request.Id)).FirstOrDefault();
            HttpResult res = new HttpResult(uploadfileDetails.FileData, uploadfileDetails.ContentType);
            res.Headers[HttpHeaders.ContentDisposition] = "attachment; filename=" + uploadfileDetails.DisplayName;
            return res;
        }

        public string replacethestring(string deger1)
        {
            deger1 = deger1.ToLower();
            deger1 = deger1.Replace(@"""", "\"");
            deger1 = deger1.Replace("{", "");
            deger1 = deger1.Replace("}", "");
            deger1 = deger1.Replace("'", "");
            deger1 = deger1.Replace("\"", "");
            return deger1;
        }


        /// <summary>
        /// Get Headcount by Id
        /// </summary>
        /// <param name="r"></param>
        /// <returns></returns>
        public HeadCountDTO Get(HeadCountList r)
        {

            HeadCount headcount = null;
            List<UploadFileDetail> uploadedFiles = null;
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandTimeout = 300;
                dbCmd.Parameters.Add(new SqlParameter("@Id", r.Id));
                dbCmd.CommandText = "sp_GetHeadcountDetailById";
                using (var reader = dbCmd.ExecuteReader())
                {
                    headcount = reader.ConvertTo<HeadCount>();
                }
            }

            var result = new HeadCountDTO();
            result.HeadCountItem = headcount == null ? new HeadCount() : headcount;

            //Get File Name with Id
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandTimeout = 300;
                dbCmd.Parameters.Add(new SqlParameter("@Id", r.Id));
                dbCmd.CommandText = "sp_GetUploadedFilesByHeadcountId";
                using (var reader = dbCmd.ExecuteReader())
                {
                    uploadedFiles = reader.ConvertToList<UploadFileDetail>();
                }
            }

            if (uploadedFiles.Count > 0)
            {

                result.UploadFileDetails = uploadedFiles;
            }
            else
            {
                result.UploadFileDetails = new List<UploadFileDetail>();
            }

            return result;
        }




        /// <summary>
        /// HeadCountLookupsReq
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public HeadcountLookupDTO Get(HeadCountLookupsReq request)
        {

            var StatusCol = Db.Select<Status>().Where(a => a.Active == true).OrderBy(a => a.StatusName).ToList();
            var HiringCompanyCol = Db.Select<HiringCompany>().Where(a => a.Active == true).OrderBy(a => a.HiringCompanyName).ToList();
            var OrganizationCol = Db.Select<Organization>().Where(a => a.Active == true).OrderBy(a => a.OrganizationName).ToList();
            var SecurityPassCol = Db.Select<SecurityPass>().Where(a => a.Active == true).OrderBy(a => a.SecurityPassName).ToList();
            var PositionCol = Db.Select<Position>(a => a.Active == true).OrderBy(a => a.PositionName).ToList();
            var LocalPositionCol = Db.Select<LocalPosition>(a => a.Active == true).OrderBy(a => a.LocalPositionCode).ToList();
            var LocationCol = Db.Select<Location>(a => a.Active == true).OrderBy(a => a.LocationName).ToList();
            var headcountUserList = Db.Select<HeadCount>().Select(i => new HeadcountUserDTO
            {
                Surname = i.Surname,
                Forename = i.Forename,
                Id = i.Id,
                FullName = i.Surname + ", " + i.Forename
            }).OrderBy(a => a.FullName).ToList();


            var lookups = new HeadcountLookupDTO
            {
                HiringCompanyCol = HiringCompanyCol,
                OrganizationCol = OrganizationCol,
                SecurityPassCol = SecurityPassCol,
                StatusCol = StatusCol,
                HeadcountUserList = headcountUserList,
                PositionCol = PositionCol,
                LocalPositionCol = LocalPositionCol,
                LocationCol = LocationCol
            };
            return lookups;
        }





        /// <summary>
        /// Get List HeadCount detail
        /// </summary>
        /// <param name="r"></param>
        /// <returns></returns>
        public List<HeadCount> Post(HeadCountnallList r)
        {
            List<HeadCount> results = null;
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandTimeout = 300;
                dbCmd.CommandText = "sp_GetHeadcountDetailList";
                using (var reader = dbCmd.ExecuteReader())
                {
                    results = reader.ConvertTo<List<HeadCount>>().ToList();
                }
            }
            return results;
        }

        public HeadCountDTO Post(HeadCountSave p)
        {
            using (System.Data.IDbTransaction dbTrans = Db.BeginTransaction())
            {
                try
                {
                    HeadCount HeadCountItem = p.Headcount;
                    //If inserting
                    if (HeadCountItem.Id == 0)
                    {


                        HeadCountItem.CreatedBy = HeadCountItem.UpdatedBy = WindowsHelper.WindowsUserName;
                        HeadCountItem.CreatedDate = HeadCountItem.UpdatedDate = DateTime.Now;
                        HeadCountItem.Id = Convert.ToInt32(Db.GetLastInsertId());
                    }
                    // Else updating
                    else
                    {
                        HeadCountItem.UpdatedBy = WindowsHelper.WindowsUserName;
                        HeadCountItem.UpdatedDate = DateTime.Now;
                    }

                    // Save and Commit all changes to the database
                    Db.Save<HeadCount>(HeadCountItem);


                    if (HeadCountItem.Id == 0)
                        HeadCountItem.Id = Convert.ToInt32(Db.GetLastInsertId());

                    List<UploadFileDetail> UploadFileDetailsList = p.UploadFileDetailList;
                    Db.Delete<UploadFileDetail>(x => x.HeadCountID == HeadCountItem.Id);



                    foreach (UploadFileDetail item in UploadFileDetailsList)
                    {
                        Db.Insert(new UploadFileDetail
                        {

                            HeadCountID = HeadCountItem.Id,
                            ContentType = item.ContentType,
                            DisplayName = item.DisplayName,
                            Extension = item.Extension,
                            FileData = item.FileData,
                            FileSize = item.FileSize,
                            Name_File = item.Name_File,
                            UploadType = item.UploadType,
                            CreatedBy = WindowsHelper.WindowsUserName,
                            UpdatedBy = WindowsHelper.WindowsUserName,
                            CreatedDate = DateTime.Now,
                            UpdatedDate = DateTime.Now

                        });
                    }

                    dbTrans.Commit();

                    HeadCountList r = new HeadCountList();
                    r.Id = HeadCountItem.Id;

                    return Get(r);

                }
                catch (Exception ex)
                {
                    dbTrans.Rollback();
                    ErrorLogger.InsertError("Could not update HeadCount", ex);
                    throw new Exception("Could not update HeadCount", ex);
                }
            }
        }




        public HeadCountDTO Put(HeadCountUpdate req)
        {
            List<UploadFileDetail> uploadedFiles = null;

            req.Headcount.UpdatedBy = WindowsHelper.WindowsUserName;
            req.Headcount.UpdatedDate = DateTime.Now;
            Db.Update<HeadCount>(req.Headcount);

            Db.Delete<UploadFileDetail>(x => x.HeadCountID == req.Headcount.Id);

            foreach (var item in req.UploadFileDetailList)
            {
                Db.Save<UploadFileDetail>(item);
            }

            //Get File Name with Id
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandTimeout = 300;
                dbCmd.Parameters.Add(new SqlParameter("@Id", req.Headcount.Id));
                dbCmd.CommandText = "sp_GetUploadedFilesByHeadcountId";
                using (var reader = dbCmd.ExecuteReader())
                {
                    uploadedFiles = reader.ConvertToList<UploadFileDetail>();
                }
            }

            var result = new HeadCountDTO
            {
                HeadCountItem = Db.GetById<HeadCount>(req.Headcount.Id)

            };

            if (uploadedFiles.Count > 0)
            {

                result.UploadFileDetails = uploadedFiles;
            }
            else
            {
                result.UploadFileDetails = new List<UploadFileDetail>();
            }

            return result;
        }

    }
}
