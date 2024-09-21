using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Selenium.Pages
{
    public class YFlowLoginPage : BasePage
    {

        private string _submitButton = "//form/button";
        private string _usernameInput = "//input[@placeholder='Usuario']";
        private string _passwordInput = "//input[@placeholder='Contraseña']";
        public YFlowLoginPage() : base(Driver,TimeSpan.FromSeconds(50))
        {
        }
        public void NavigateToYFlowLogin()
        {
            NavigateTo("https://qa.ysocial.net/Oldversion/yflow/home");
        }

        public void Login()
        {
            SendKeysInto(_usernameInput,"qadmin");
            SendKeysInto(_passwordInput,"asdQWE!23!\"#");
            ClickSubmitButton();
        }

        public void ClickSubmitButton()
        {
            ClickElement(_submitButton);
        }
    }
}
