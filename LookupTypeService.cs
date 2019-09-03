using System;
using System.Collections.Generic;
using System.Linq;
using ServiceModel.Types;
using ServiceStack.OrmLite;
using ServiceStack.ServiceHost;
using ServiceStack.ServiceInterface;
using UkAppsUtils.Authorisation;


namespace Headcount.ServiceInterface
{
   
        #region route
        [Route("/lookuptypes", "GET")]
        [Route("/lookuptypes/{id}", "GET")]
        public class LookupTypeList : IReturn<List<LookupType>>
        {
            public int? Id { get; set; }
        }

        [Route("/lookuptype", "POST")]
        public class LookupTypeSave : IReturn<List<LookupType>>
        {
            public LookupType LookupType { get; set; }
        }
        #endregion

        public class LookupTypeService : Service
        {            
            // Return a single lookup type or list of all lookup types
            public List<LookupType> Get(LookupTypeList r)
            {
               
              return r.Id != null ? Db.Select<LookupType>(o => o.Id == r.Id).OrderBy(o => o.Name).ToList() : Db.Select<LookupType>().OrderBy(o => o.Name).ToList();
                
            }

            // Update a lookup type
            [PermittedRoles("Admin")]
            public List<LookupType> Post(LookupTypeSave p)
            {
                try
                {
                    // Store the lookup type
                    LookupType lookupType = p.LookupType;
                    lookupType.Audit_UpdatedBy = WindowsHelper.WindowsUserName;
                    lookupType.Audit_UpdatedDate = DateTime.Now;
                    Db.Update<LookupType>(lookupType);

                    // Return the new list of lookup types
                    return Db.Select<LookupType>().OrderBy(o => o.Name).ToList();
                }
                catch (Exception ex)
                {
                    //ErrorLogger.InsertError("Could not update lookup type", ex);
                    throw new Exception("Could not update lookup type1", ex);
                }
            }
        }
    }

