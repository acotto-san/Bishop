using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Models
{
    public class Credentials : ICredentials
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
