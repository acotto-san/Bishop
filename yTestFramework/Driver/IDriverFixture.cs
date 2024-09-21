using OpenQA.Selenium;

namespace yTestFramework.Driver
{
    public interface IDriverFixture
    {
        IWebDriver Driver { get; }

        Uri BaseUrl { get; }

        void Dispose();
    }
}