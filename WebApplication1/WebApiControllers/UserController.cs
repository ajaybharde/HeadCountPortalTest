using Headcount.DTO;
using HeadCount.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HeadCount.Portal.WebApiControllers
{
    public class UserController : ApiController
    {
        private UserManager _userManager; 
        public UserController()
        {
            _userManager = new UserManager();
        }
        // GET api/<controller>
        public UserDTO Get()
        {
            return _userManager.GetUser();
        }

        // GET api/<controller>/5
        public List<UserDTO> Get(string role)
        {
            return _userManager.GetAuthUsersByRole(role) ;
        }
        [HttpPost]
        
        public List<UserDTO> Users(string role)
        {
            return _userManager.GetAuthUsersByRole(role);
        }


        

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}