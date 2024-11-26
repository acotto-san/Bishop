using Bishop.Common;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.Supervisor
{
    public class SupervisorLoginPage
    {
        private readonly IPage _page;
        private readonly string _urlPath = "/Login.aspx";

        public SupervisorLoginPage(IPage page)
        {
            _page = page;
        }

        private ILocator _userField => _page.GetByPlaceholder("Usuario");
        private ILocator _passwordField => _page.GetByPlaceholder("Contraseña");
        private ILocator _submitButton => _page.Locator("xpath=//button[@id='sumbitLogin']");

        async public Task LogInWithCredentials(string username, string password)
        {
            await GotToAsync();
            await CompleteFormWithCredentials(username, password);
            await _submitButton.ClickAsync();
        }

        async public Task CompleteFormWithCredentials(string username, string password)
        {
            await _userField.ClickAsync();
            await _userField.FillAsync(username);
            await _passwordField.ClickAsync();
            await _passwordField.FillAsync(password);
        }

        async public Task GotToAsync()
        {
            await _page.GotoAsync(TestConfiguration.SocialBaseUrl+_urlPath);
        }

    }
}
