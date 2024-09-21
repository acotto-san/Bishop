using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Pages.PageInterfaces
{
    public interface IFacebookLoginPage : ILoginPage
    {
        new void PerformLogin()
        {
            PerformLogin(new Credentials
            {
                Username = "qayzn76@gmail.com",
                Password = "asdQWE!23"
            });
        }
    }
}
