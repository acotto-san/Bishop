using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.Supervisor.Configurations
{
    public class IncomingMessagesTab : BaseWebComponent
    {
        public IncomingMessagesTab(IPage page) : base(page)
        {
        }

        internal async Task FillForm()
        {
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede generar múltiples respuestas a partir de un mensaje", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede unificar perfiles.", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede modificar los datos de los perfiles de usuarios que se contactan a través de las redes sociales.", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede cerrar casos", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden enviar audios", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden responder mensajes de Messenger utilizando las plantillas de mensaje especificadas en el servicio", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden responder mensajes de Whatsapp utilizando las plantillas de mensaje especificadas en el servicio", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden marcar con \"Me gusta\" mensajes/publicaciones de facebook", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden ocultar mensajes/publicaciones de facebook", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden hacer retweet de un mensaje de twitter cuando lo están respondiendo", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si los agentes pueden hacer favorito de un tweet cuando lo están respondiendo", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro indica si el agente puede especificar a qué cola se devolverán los mensajes", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede devolver mensajes asignados a la cola", Exact = true }).Locator("span").ClickAsync();
            await _page.GetByRole(AriaRole.Row, new() { Name = "Este parámetro especifica si el agente puede descartar mensajes", Exact = true }).Locator("span").ClickAsync();
        }

        internal async Task NavigateTo()
        {
            await _page.GetByRole(AriaRole.Link, new() { Name = "Mensajes entrantes" }).ClickAsync();
        }
    }
}
