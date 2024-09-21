using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System.Net;

namespace Bishop.Selenium
{
    public class InterceptTest
    {
        [Test]
        public void IntercepHTTPRequestTest()
        {
            //// Iniciar el proxy
            //var proxyServer = new ProxyServer();
            //var proxy = proxyServer.StartProxy();

            //// Configurar el navegador para usar el proxy
            //var seleniumProxy = new Proxy { HttpProxy = proxy.Address().ToString(), SslProxy = proxy.Address().ToString() };
            //var chromeOptions = new ChromeOptions();
            //chromeOptions.Proxy = seleniumProxy;

            //// Iniciar el WebDriver con el proxy configurado
            //IWebDriver driver = new ChromeDriver(chromeOptions);

            //// Interceptar y modificar una respuesta
            //proxy.NewHar("example.com");
            //proxy.AddResponseFilter((response, contents, info) =>
            //{
            //    if (info.Url.Contains("api/some-endpoint"))
            //    {
            //        // Modificar el body de la respuesta
            //        var modifiedContent = Encoding.UTF8.GetBytes("{\"modified\": \"true\"}");
            //        contents.SetContents(modifiedContent);
            //    }
            //});

            //// Navegar a una página
            //driver.Navigate().GoToUrl("http://example.com");

            //// Detener el proxy
            //proxyServer.Stop();
            //driver.Quit();
        }
    }
}
