using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Models
{
    public class AssignedMessageSlot : IAssignedMessageSlot
    {
        public AssignedMessageSlot(IWebElement chatSlot, IWebDriver driver)
        {
            ChatSlot = chatSlot;
            Driver = driver;

            Actions actions = new Actions(driver);
            actions.MoveToElement(chatSlot).Perform();
            Date = driver.FindElement(By.XPath("//div[contains(@class,'popover-message')]/div[1]/span[1]")).Text;
            Sender = driver.FindElement(By.XPath("//div[contains(@class,'popover-message')]/div[1]/span[2]")).Text;
            Service = driver.FindElement(By.XPath("//div[contains(@class,'popover-message')]/div[1]/span[3]")).Text;
            Message = driver.FindElement(By.XPath("//div[contains(@class,'popover-message')]/div[2]/span[1]")).Text;
            Queue = driver.FindElement(By.XPath("//div[contains(@class,'popover-message')]/div[3]/span[2]")).Text;
        }

        public IWebElement ChatSlot { get; set; }
        public IWebDriver Driver { get; }
        public string Sender { get; set; }
        public string Message { get; set; }
        public string Queue { get; set; }
        public string Date { get; set; }
        public string Service { get; set; }
    }
}
