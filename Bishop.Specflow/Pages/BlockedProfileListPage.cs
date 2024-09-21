using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit.Sdk;
using ySpecFlow.Models;
using ySpecFlow.Pages.PageInterfaces;
using yTestFramework.Driver;
using yTestFramework.Extensions;

namespace ySpecFlow.Pages
{
    public class BlockedProfileListPage : ProfileListPage, IBlockedProfileListPage
    {
        public BlockedProfileListPage(IDriverFixture driverFixture) : base(driverFixture)
        {
        }

        public IWebElement Flag => Driver.FindElement(By.XPath("//span[@id='blockedListTitle']"));

        protected override IWebElement EntryPoint { get => Driver.FindElement(By.XPath("//a[contains(@onclick,'LoadBlocked()')]")); }


    }
}
