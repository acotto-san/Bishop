using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.Mocks
{
    public static class MockRTAgentsResponse
    {
        public static async Task LowQuantityRowsPerPage(this IPage page, int itemsPerPage = 5)
        {
            await page.RouteAsync("**/RTAgents.aspx", async route =>
            {
                IAPIResponse response = await route.FetchAsync();
                var body = await response.TextAsync();

                // Modificar el valor de la variable en el HTML
                var modifiedBody = body.Replace("var pageSize = 50;", $"var pageSize = {itemsPerPage};");

                // Responder con el HTML modificado
                await route.FulfillAsync(new RouteFulfillOptions
                {
                    Response = response,
                    Body = modifiedBody
                });
            });
        }
    }
}
