using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.Supervisor.Configurations
{
    public class OtherPermissionsTab : BaseWebComponent
    {
        public OtherPermissionsTab(IPage page) : base(page)
        {
        }

        internal async Task FillForm()
        {
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si el agente será advertido al enviar un mensaje público por una ventana emergente", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si el agente podrá acceder a la sección mis casos pendientes y podrá marcar los casos como pendientes (tanto de respuesta del cliente como para retomar el caso en el futuro)", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede acceder a la sección búsqueda de casos", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente podrá buscar casos en los cuales no formó parte", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si el agente podrá enviar plantillas de HSM desde la sección de busqueda de casos", Exact = true }).Locator("span").ClickAsync();
        }

        internal async Task NavigateTo()
        {
            await _page.GetByRole(AriaRole.Link, new() { Name = "Otros permisos" }).ClickAsync();
        }
    }
}
