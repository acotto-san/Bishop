using AngleSharp.Dom;
using Microsoft.Extensions.DependencyInjection;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using ySpecFlow.Models;
using ySpecFlow.Pages.PageInterfaces;
using yTestFramework.Driver;
using yTestFramework.Extensions;

namespace ySpecFlow.Pages
{


    public class AgentHeaderPageComponent : IAgentHeaderComponentPage
    {
        IWebDriver Driver;

        public AgentHeaderPageComponent(IDriverFixture driverFixture) => Driver = driverFixture.Driver;

        IWebElement btnActualStatus => Driver.FindElement(By.XPath("//div[@class='divided-circle']//following-sibling::span"));

        IWebElement btnDisponibleStatus => Driver.FindElement(By.XPath("//*[contains(text(),'Disponible')]"));

        IWebElement imgAvatar => Driver.FindElement(By.ClassName("user-image"));

        IWebElement btnLogout => Driver.FindElement(By.CssSelector(".fa.fa-lg.fa-power-off"));

        IWebElement btnConfirmLogoutModal => Driver.FindElement(By.XPath("//*[contains(text(), 'Aceptar')]"));

        IWebElement btnStatusByName(ConnectionStatuses status) => Driver.FindElement(By.XPath($"//*[contains(text(),'{status.ToString()}')]"));

        string actualStatusText => btnActualStatus.Text;

        public IEnumerable<IWebElement> ChatSlots => Driver.FindElements(By.XPath("//*[@class='navbar-header']/descendant::ul/li"));

        public List<AssignedMessageSlot> AssignedMessages
        {
            get
            {

                List<AssignedMessageSlot> assignedMessages = new List<AssignedMessageSlot>();
                try
                {
                    foreach (IWebElement chatSlot in ChatSlots)
                    {
                        if (chatSlot.GetAttribute("class").Contains("assigned-messages"))
                        {
                            assignedMessages.Add(new AssignedMessageSlot(chatSlot, Driver));
                        }
                    }
                }
                catch (StaleElementReferenceException)
                {
                    throw new StaleElementReferenceException();
                }

                return assignedMessages;
            }
        }

        public void PerformLogout(IAgentLoginPage loginPage)
        {
            imgAvatar.Click();
            btnLogout.Click();
            btnConfirmLogoutModal.Click();

            loginPage.IsDisplayed();

        }

        public void ChangeStatus(ConnectionStatuses status)
        {

            if (actualStatusText != status.ToString())
            {
                btnActualStatus.Click();
                btnStatusByName(status).Click();
            }
            else
            {
                throw new Exception();
            }

        }

        public bool IsVisible()
        {
            return btnActualStatus.Displayed;
        }

        public bool IsAnyMessageAssigned()
        {
            foreach (var chatSlot in ChatSlots)
            {
                if (chatSlot.GetAttribute("class").Contains("assigned-messages"))
                {
                    return true;
                };
            }
            return false;
        }



    }
}
