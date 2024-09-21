using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Selenium.Pages
{
    public class YFlowDashboard : BasePage
    {
        private string _submitButton = "//button[@type='submit']";

        public YFlowDashboard() : base(Driver)
        {
        }

        public void OpenProyectNamed(string name)
        {
            YFlowCard card = YFlowCard.Named(name);
            card.ClickOnCard();
        }

        public void ConfirmModal()
        {
            Find(_submitButton).Click();
        }
    }
}
