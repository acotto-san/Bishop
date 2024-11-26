using Bishop.Common;
using FluentAssertions;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.Supervisor.Reports
{
    public class RTAgentsPage : BasePage
    {
        protected override string BaseUrl => TestConfiguration.SocialBaseUrl;
        protected override string Endpoint => "/Reports/RTAgents.aspx";
        public RTAgentsPage(IPage page) : base(page)
        {
        }

        async public Task Navigate()
        {
            FullUrl.Should().StartWith("http");
            await _page.GotoAsync(FullUrl);
        }

    }
}
