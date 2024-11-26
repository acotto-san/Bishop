using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.Supervisor.Configurations
{
    public class MessagesByServiceTab : BaseWebComponent
    {
        public MessagesByServiceTab(IPage page) : base(page)
        {
        }

        async public Task NavigateTo()
        {
            await _page.GetByRole(AriaRole.Link, new() { Name = "Mensajes por servicio" }).ClickAsync();
        }

        async public Task FillForm()
        {
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de Twitter para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de Facebook para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de Facebook Messenger para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de mail para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de chat para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de WhatsApp para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si se habilita el servicio de Instagram para recibir mensajes", Exact = true }).Locator("span").ClickAsync();
        }

    }
}
