using Bishop.Common;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects
{
    public abstract class SocialBasePage : BasePage
    {
        protected override string BaseUrl => TestConfiguration.SocialBaseUrl;

        protected SocialBasePage(IPage page) : base(page)
        {
        }
    }
}
