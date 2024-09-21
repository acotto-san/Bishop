using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Driver;
using yTestFramework.Extensions;


namespace ySpecFlow.Pages
{
    public class ProfileListPage : IProfileListPage
    {

        public ProfileListPage(IDriverFixture driverFixture)
        {
            Driver = driverFixture.Driver;
            BaseUrl = driverFixture.BaseUrl;
            Uri = new Uri(BaseUrl, new Uri(Path, UriKind.Relative));
        }

        public Uri BaseUrl { get; }

        public IWebDriver Driver { get; }

        public string Path => "Configuration/SocialUserProfilesLists.aspx";

        public Uri Uri { get; }

        IWebElement tblList => Driver.FindElement(By.XPath("//table[@id='tableProfiles']"));

        IWebElement customModal => Driver.FindElement(By.XPath("//*[@id='colorbox']"));

        IWebElement btnConfirmModal => Driver.FindElement(By.XPath("//*[@id='colorbox']//descendant::*[@rel='confirm']"));

        IWebElement tdDeleteProfileConfirmationtext => Driver.FindElement(By.XPath("//*[contains(text(),'Se quitó el usuario/perfil de la lista')]"));

        public IWebElement Flag { get; }

        protected virtual IWebElement EntryPoint { get; }
        public void Navigate()
        {
            //Como es una pagina sin url fija primero hay que ingresar a la pagina de listas de perfiles
            Driver.Navigate().GoToUrl(Uri);
            //y hacer click en la lista deseada
            EntryPoint.Click();
        }

        private void PerformClickOnSpecialValue(string columnName, string value, int specialControlIndex)
        {

            // Store the original implicit wait timeout
            TimeSpan originalTimeout = Driver.Manage().Timeouts().ImplicitWait;

            try
            {
                // Set a temporary implicit wait timeout
                TimeSpan temporaryTimeout = TimeSpan.FromMilliseconds(100);
                Driver.Manage().Timeouts().ImplicitWait = temporaryTimeout;

                // Perform your operations with the temporary timeout
                // ...
                tblList.PerformActionOnCell(2, columnName, value, specialControlIndex);
                // Restore the original implicit wait timeout
            }
            finally
            {
                Driver.Manage().Timeouts().ImplicitWait = originalTimeout;
            }
        }

        private void PerformClickOnSpecialValueOfFirstRow(int specialControlIndex)
        {

            // Store the original implicit wait timeout
            TimeSpan originalTimeout = Driver.Manage().Timeouts().ImplicitWait;

            try
            {
                // Set a temporary implicit wait timeout
                TimeSpan temporaryTimeout = TimeSpan.FromMilliseconds(100);
                Driver.Manage().Timeouts().ImplicitWait = temporaryTimeout;

                // Perform your operations with the temporary timeout
                // ...
                tblList.PerformActionOnCellOnFirstRow(2, specialControlIndex);
                // Restore the original implicit wait timeout
            }
            finally
            {
                Driver.Manage().Timeouts().ImplicitWait = originalTimeout;
            }
        }

        public void DeleteElementOnListByName(ISocialUserProfile socialUserProfile)
        {
            try
            {
                PerformClickOnSpecialValue("Nombre", socialUserProfile.Name, 0);

            }
            catch
            {
                throw new PendingStepException();
            }
            if (customModal.Displayed)
            {
                btnConfirmModal.Click();
            }

            if (tdDeleteProfileConfirmationtext.Displayed)
            {
                btnConfirmModal.Click();
            }
        }

        public void DeleteFirstElementOnList()
        {
            try
            {
                PerformClickOnSpecialValueOfFirstRow(0);

            }
            catch
            {
                throw new PendingStepException();
            }
            if (customModal.Displayed)
            {
                btnConfirmModal.Click();
            }

            if (tdDeleteProfileConfirmationtext.Displayed)
            {
                btnConfirmModal.Click();
            }
        }


    }
}
