using WebDriverManager.DriverConfigs.Impl;
using WebDriverManager;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium.Chrome;
//using Bishop.Selenium.Helpers;
using System;
using SeleniumExtras.WaitHelpers;

namespace Bishop.Selenium.Pages
{
    public class BasePage
    {
        // Declaración de una variable estática 'driver' de tipo IWebDriver
        protected static IWebDriver Driver;

        // Declaración de una variable de instancia 'wait' de tipo WebDriverWait
        private WebDriverWait _wait;

        // Constructor estático para configurar el WebDriver
        static BasePage()
        {
            // Configura el WebDriver para Chrome
            // Asegúrate de que el ChromeDriver esté en tu PATH o especifica la ruta
            ChromeOptions options = new ChromeOptions();
            options.AddArgument("--disable-notifications");
            options.AddArgument("--suppress-message-center-popups");
            new DriverManager().SetUpDriver(new ChromeConfig());
            Driver = new ChromeDriver(options);
        }

        // Constructor de BasePage que acepta un objeto IWebDriver como argumento
        public BasePage(IWebDriver webDriver, TimeSpan waitTime)
        {
            Driver = webDriver;
            _wait = new WebDriverWait(Driver, waitTime);
        }

        public BasePage(IWebDriver webDriver)
        {
            Driver = webDriver;
            _wait = new WebDriverWait(Driver, TimeSpan.FromSeconds(5));
        }

        // Método estático para navegar a una URL
        public static void NavigateTo(string url)
        {
            Driver.Navigate().GoToUrl(url);
        }

        //Método estático para cerrar la instancia del driver. 
        public static void CloseBrowser()
        {
            Driver.Quit();
        }

        // Encuentra y devuelve un WebElement en la página utilizando un locator XPath
        public IWebElement Find(string locator)
        {
            return _wait.Until(ExpectedConditions.ElementExists(By.XPath(locator)));
        }

        // Método para hacer clic en un elemento
        public void ClickElement(string locator)
        {
            Find(locator).Click();
        }

        public void SendKeysInto(string locator, string keysToSend)
        {
            Find(locator).Clear();
            Find(locator).SendKeys(keysToSend);
        }

        public void SelectFromDropdownByValue(string locator, string value)
        {
            SelectElement dropdown = new SelectElement(Find(locator));
            dropdown.SelectByValue(value);
        }
        public void SelectFromDropdownByIndex(string locator, int index)
        {
            SelectElement dropdown = new SelectElement(Find(locator));
            dropdown.SelectByIndex(index);
        }

        public int DropdownSize(String locator)
        {
            SelectElement dropdown = new SelectElement(Find(locator));
            IList<IWebElement> dropdownOptions = dropdown.Options;
            return dropdownOptions.Count;
        }
    }
}
