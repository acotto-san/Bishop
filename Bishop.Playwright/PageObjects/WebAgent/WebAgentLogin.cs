using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.WebAgent
{
    public class WebAgentLogin : SocialBasePage
    {
        protected override string Endpoint => "/agent/#/login";
        public WebAgentLogin(IPage page) : base(page)
        {
        }
        private ILocator _userField => _page.Locator("[name='username']");
        private ILocator _passwordField => _page.Locator("[name='password']");
        private ILocator _submitButton => _page.Locator("xpath=//button[text()='Ingresar']");
        public async Task GotoAsync()
        {
            await _page.GotoAsync(FullUrl);
        }

        public async Task LogInWithCredentials(string username, string password)
        {
            try
            {
                await GotoAsync();
                await FillForm(username, password);
                await _submitButton.ClickAsync();
            }catch (Exception ex)
            {
                Trace.TraceError(ex.Message);
            }
        }

        public async Task FillForm(string username, string password)
        {
            await _userField.FillAsync(username);
            await _passwordField.FillAsync(password);
        }
    }
}
