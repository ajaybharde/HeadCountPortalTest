using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using ServiceModel.Types;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using UkAppsUtils.Authorisation;
using UkAppsUtils.Logging;
using Headcount.DTO;


namespace Headcount.ServiceInterface
{
    #region dto
    #endregion

    #region route
    [Route("/lookups/{id}", "GET")]
    public class LookupList : IReturn<HeadCountLookUP>
    {
        public int? Id { get; set; }
    }

    [Route("/lookups/type/{lookuptypeid}", "GET")]
    public class LookupByTypeList : IReturn<List<HeadCountLookUP>>
    {
        public int LookupTypeID { get; set; }
    }

    [Route("/lookup", "POST")]
    public class LookupSave : IReturn<List<HeadCountLookUP>>
    {
        public HeadCountLookUP Lookuphead { get; set; }
    }
    #endregion

    [PermittedRoles(RoleDTO.Facilities_Admin_Role, 
        RoleDTO.System_Admin_Role)]
    public class LookupService : Service
    {
        // Return a single lookup item or list of all lookup items

        public HeadCountLookUP Get(LookupList r)
        {
            //Lookup result = Db.Select<HeadCountLookUP>(o => o.Id == r.Id).FirstOrDefault();
            //return result;

            return null;
        }


        public List<HeadCountLookUP> Get(LookupByTypeList request)
        {
            var results = Db.SqlList<HeadCountLookUP>("EXEC sp_GETLookup @lookupTypeId", new { request.LookupTypeID });
            return results;
        }



        public List<HeadCountLookUP> Post(LookupSave p)
        {
            using (IDbTransaction dbTrans = Db.BeginTransaction())
            {
                try
                {
                    HeadCountLookUP lookup = p.Lookuphead;


                    using (var dbCmd = Db.CreateCommand())
                    {
                        dbCmd.CommandType = CommandType.StoredProcedure;
                        dbCmd.CommandText = "sp_SaveLookup";
                        dbCmd.Parameters.Add(new SqlParameter("@name", lookup.Name));
                        dbCmd.Parameters.Add(new SqlParameter("@description", lookup.Description));
                        dbCmd.Parameters.Add(new SqlParameter("@active", lookup.Active == null ? false : lookup.Active));
                        dbCmd.Parameters.Add(new SqlParameter("@UpdatedBy", WindowsHelper.WindowsUserName));
                        dbCmd.Parameters.Add(new SqlParameter("@UpdateDate", DateTime.Now));
                        dbCmd.Parameters.Add(new SqlParameter("@CreatedBy", WindowsHelper.WindowsUserName));
                        dbCmd.Parameters.Add(new SqlParameter("@CreatedDate", DateTime.Now));
                        dbCmd.Parameters.Add(new SqlParameter("@lookupTypeId", lookup.LookupTypeID));
                        dbCmd.Parameters.Add(new SqlParameter("@lookupId", lookup.Id));
                        //dbCmd.Parameters.Add(new SqlParameter("@Return_Message", val2));

                        var dr = dbCmd.ExecuteReader();
                        dr.Dispose();
                        dbCmd.Dispose();
                    }

                    dbTrans.Commit();

                    // Return the new list of lookup items
                    return Get(new LookupByTypeList() { LookupTypeID = (int)p.Lookuphead.LookupTypeID });
                    //return null;
                }
                catch (Exception ex)
                {
                    dbTrans.Rollback();
                    ErrorLogger.InsertError("Could not update lookup", ex);
                    throw new Exception("Could not update lookup", ex);
                }
            }
        }


        private void UpdateOrderBy(Lookup lookup)
        {
            using (var dbCmd = Db.CreateCommand())
            {
                dbCmd.CommandType = CommandType.StoredProcedure;
                dbCmd.CommandText = "sp_UpdateOrderBy";
                dbCmd.Parameters.Add(new SqlParameter("@lookupTypeId", lookup.LookupTypeID));
                dbCmd.Parameters.Add(new SqlParameter("@lookupId", lookup.Id));
                dbCmd.Parameters.Add(new SqlParameter("@orderBy", lookup.OrderBy));
                dbCmd.ExecuteNonQuery();
            }
        }
    }
}
