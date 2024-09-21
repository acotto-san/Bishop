using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebDriverManager.DriverConfigs.Impl;
using WebDriverManager;

namespace Bishop.Specflow.Pages
{
    public class BasePage
    {
        // Declaración de una variable estática 'driver' de tipo IWebDriver
        protected static IWebDriver driver;

        // Declaración de una variable de instancia 'wait' de tipo WebDriverWait
        private WebDriverWait wait;

        // Constructor estático para configurar el WebDriver
        static BasePage()
        {
            // Configura el WebDriver para Chrome
            // Asegúrate de que el ChromeDriver esté en tu PATH o especifica la ruta
            ChromeOptions options = new ChromeOptions();
            options.AddArgument("--disable-notifications");
            options.AddArgument("--suppress-message-center-popups");
            new DriverManager().SetUpDriver(new ChromeConfig());
            driver =  new ChromeDriver(options);
        }

        // Constructor de BasePage que acepta un objeto IWebDriver como argumento
        public BasePage(IWebDriver webDriver)
        {
            driver = webDriver;
            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
        }

        // Método estático para navegar a una URL
        public static void NavigateTo(string url)
        {
            driver.Navigate().GoToUrl(url);
        }
    }
}



