using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Models
{
    public class Person : IPerson
    {
        public List<ISocialNetworkAccount> SocialNetworkAccounts { get; set; }
    }
}
