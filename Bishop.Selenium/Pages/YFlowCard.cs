using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Selenium.Pages
{
    public class YFlowCard : BasePage
    {
        private string _optionDropdownToggle = "//button[@class=\"dropdown-toggle\"]";
        private string _cardNamed = "//app-dashboard-flow[.//p[text()=\"{0}\"]]";
        private string _title = "//div[@class=\"name\"]//p";
        private string _name;

        private YFlowCard() : base(Driver)
        {
        }

        static public YFlowCard Named(string name)
        {
            YFlowCard card = new YFlowCard();
            card._name = name;
            return card;
        }

        private IWebElement GetCardElement()
        {
            string xpathCard = string.Format(_cardNamed, _name);
            return Find(xpathCard);
        }


        private void OpenOptions()
        {
            IWebElement card = GetCardElement();
            card.FindElement(By.XPath(_optionDropdownToggle)).Click();
        }

        public void ImportJson()
        {
            OpenOptions();
            //OpenOptionsOfCardNamed().FindElement(By.XPath(_importButton)).Click();
            //ClickElement(_submitButton);
        }
        public void ClickOnCard() 
        {
            GetCardElement().Click();
        }

        public void ClickInDropdownOption(string option)
        {
            OpenOptions();
            YFlowCardOptions optionsDropdown= new YFlowCardOptions();
            optionsDropdown.ClickInOptionNamed(option);

        }


    }
}
