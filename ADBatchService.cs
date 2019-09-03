using Headcount.ServiceModel.Types;
using ServiceStack.OrmLite;
using ServiceStack.ServiceInterface.Auth;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UkAppsUtils.Config;
using UkAppsUtils.LDAP;

namespace Headcount.ServiceInterface.Services
{
    public class ADBatchService
    {

        private static IDbConnection Db = new OrmLiteConnectionFactory(ConfigHelper.COPConnStr, SqlServerDialect.Provider).OpenDbConnection();

        public LDAPUser CreateUser(string accountName)
        {
            LDAPUser adUser = LDAPHelper.SearchAccurateUserInfo(accountName, true).Where(x => string.IsNullOrEmpty(x.Mail) != true && x.AccountDisabled != true && !x.SamaccountName.Contains("_")).OrderBy(x => x.DisplayName).FirstOrDefault();
            return adUser;
        }

        public static List<HeadCount> GetHeadcountList()
        {
            return Db.Select<HeadCount>();

        }
        /// <summary>
        /// Execute the batch
        /// </summary>
        public static void Execute()
        {
            var headcountMembers = Db.Select<HeadCount>().Select(a => UpdateHeadcount(CheckUserInAD(a))).ToList();
        }
        /// <summary>
        /// Check if user present in AD
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public static HeadCount CheckUserInAD(HeadCount headcount)
        {
            if (String.IsNullOrEmpty(headcount.UserID))
            {
                headcount.Active = null;
            }
            else
            {

                var exists = LDAPHelper.SearchAUserByLogin(headcount.UserID);
                headcount.Active = exists != null ? true : false;

            }
            return headcount;
        }
        /// <summary>
        /// UpdateHeadcount
        /// </summary>
        /// <param name="member"></param>
        /// <returns></returns>
        public static HeadCount UpdateHeadcount(HeadCount member)
        {
            Db.Update<HeadCount>(member);
            var isActive = member.Active == true ? "Active" : "Inactive";
            Console.WriteLine(member.Surname + ", " + member.Forename + " is " + isActive);
            return member;
        }
    }
}
