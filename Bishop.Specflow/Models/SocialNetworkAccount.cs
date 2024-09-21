using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Models
{
    public class SocialNetworkAccount : ISocialNetworkAccount
    {
        public ICredentials Credentials { get; set; }

    }
}
