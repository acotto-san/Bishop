using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PlaywrightSampleTests
{
    public class BrowserTypeTests
    {
        [Test]
        public async Task TestWithMobileWebkit()
        {
            using var playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            await using var browser = await playwright.Webkit.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            await using var context = await browser.NewContextAsync(playwright.Devices["iPhone 6"]);

            var page = await context.NewPageAsync();
            await page.GotoAsync("https://www.theverge.com");
            await Console.Out.WriteLineAsync("peep");
        }
    }
}
