using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PlaywrightSampleTests
{
    public class BrowserContextTests
    {
        [Test]
        public async Task TestContextWithNoViewport()
        {
            using var playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            var browser = await playwright.Firefox.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            // Create a new incognito browser context.
            var context = await browser.NewContextAsync(new BrowserNewContextOptions { ViewportSize = ViewportSize.NoViewport });
            // Create a new page in a pristine context.
            var page = await context.NewPageAsync(); ;
            await page.GotoAsync("https://www.bing.com");

            // Gracefully close up everything
            await context.CloseAsync();
            await browser.CloseAsync();
        }
    }
}
