using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using static Boa.Constrictor.Selenium.WebLocator;

namespace Bishop.Screenplay.Pages
{
    public static class YFlowDashboard
    {
        public static IWebLocator DashboardComponent => L(
            "Angular component for the yFlow dashboard",
            By.XPath("//app-dashboard"));

        public static IWebLocator FirstDropDownButton => L(
            "Primera ocurrencia del flujo con el botón de tres puntos horizontales.",
            By.XPath("(//button[@class='dropdown-toggle'])[1]"));

        public static IWebLocator ImportFromFileButton => L(
            "Botón para seleccionar que se va a importar un archivo para un flow.",
            By.CssSelector("body app-root button:nth-child(4)"));

        public static IWebLocator ConfirmUploadFlowFileButton => L(
            "Botón para confirmar que se va a ta un archivo para un flow.",
            By.CssSelector("button[type='submit']"));

        public static IWebLocator InputFileUpload => L(
            "Input para cargar archivos.",
            By.CssSelector("input[type=file]"));

        public static IWebLocator ConfirmUploadFileButton => L(
            "Botón para confirmar la carga de archivos.",
            By.Id("file-submit"));

    }
}
