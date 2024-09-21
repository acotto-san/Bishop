using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Models
{
    public interface ISocialUserProfile
    {
        string Name { get; set; }
        int Id { get; set; }
        List<ISocialNetworkAccount> SocialNetworkAccounts { get; set; }
    }

    public class SocialUserProfile : ISocialUserProfile
    {
        public string Name { get; set; }

        public int Id { get; set; }


        public List<ISocialNetworkAccount> SocialNetworkAccounts { get; set; }
    }
}
