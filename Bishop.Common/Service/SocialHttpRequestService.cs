using System.Text.RegularExpressions;
using System.Net.Http.Headers;
using System.Diagnostics;
using System.Net;
using System.Text.Json;
using System.Text;
using Bishop.Common.Utils;
using System.Text.Json.Nodes;


namespace Bishop.Common.Service
{

    public class SocialHttpRequestService : BaseRequestService
    {
        private static readonly HttpClient client = new HttpClient();

        public static async Task<string> LogInUserAndGetCookies(NetworkCredential? credential = null)
        {
            credential ??= new NetworkCredential { UserName = "qadmin", Password = "asdQWE!23QWE" }; //TODO: borrar credenciales
            HttpRequestMessage requestToGetStateValues = new HttpRequestMessage(HttpMethod.Get, TestConfiguration.SocialBaseUrl + "/Login.aspx"){};
            HttpResponseMessage htmlResponse = await SendRequestAsync(requestToGetStateValues);
            // Utiliza StateValueExtractor para obtener los valores de estado
            var stateValues = AspxStateValueExtractor.ExtractStateValues(await htmlResponse.Content.ReadAsStringAsync());


            List<KeyValuePair<string, string>> formData = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("__VIEWSTATE", stateValues["__VIEWSTATE"]),
                new KeyValuePair<string, string>("__VIEWSTATEGENERATOR", stateValues["__VIEWSTATEGENERATOR"]),
                new KeyValuePair<string, string>("__EVENTVALIDATION", stateValues["__EVENTVALIDATION"]),
                new KeyValuePair<string, string>("ctl00$contentplaceholderContenido$textboxUser", credential.UserName),
                new KeyValuePair<string, string>("ctl00$contentplaceholderContenido$textboxPassword", credential.Password),
                new KeyValuePair<string, string>("ctl00$contentplaceholderContenido$buttonLogin", "Login")
            };
            try
            {
                // Construir la solicitud POST
                var request = new HttpRequestMessage(HttpMethod.Post, $"{TestConfiguration.SocialBaseUrl}/Login.aspx")
                {
                    Content = new FormUrlEncodedContent(formData)
                };

                // Establecer las cabeceras de la solicitud
                request.Headers.Add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36");
                //request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", authorizationToken);
                request.Content.Headers.ContentType = new MediaTypeHeaderValue("application/x-www-form-urlencoded");
                // Ejecutar la solicitud
                HttpResponseMessage response = await client.SendAsync(request);
                // Leer el contenido de la respuesta (HTML)
                string responseBody = await response.Content.ReadAsStringAsync();
                response.EnsureSuccessStatusCode();


                // Extraer el valor de la cookie desde los scripts del HTML
                string cookieValue = ExtractCookieFromHtml(responseBody);

                return cookieValue;
            }
            catch (Exception e)
            {
                Trace.WriteLine($"Request error: {e.Message}");
                return null;
            }
        }

        // Método para extraer el valor de la cookie desde el HTML
        private static string ExtractCookieFromHtml(string html)
        {
            // Supongamos que el valor de la cookie está en un script similar a: var loggedUserSession = "cookie_value";
            string pattern = @"var\s+loggedUserSession\s*=\s*""(.*?)"";";
            var match = Regex.Match(html, pattern);

            if (match.Success)
            {
                return match.Groups[1].Value;
            }
            return null;
        }

        internal static async Task DisconnectAgentFromRTAgents(int agentId)
        {

            var data = new { agentId = agentId };

            var jsonBody = JsonSerializer.Serialize(data);

            try
            {
                // Construir la solicitud POST
                var request = new HttpRequestMessage(HttpMethod.Post,$"{TestConfiguration.SocialBaseUrl}/Reports/RTAgents.aspx/DisconnectAgent")
                {
                    Content = new StringContent(jsonBody, Encoding.UTF8, "application/json")
                };
                request.Content.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                request.Headers.Add("Cookie", await SocialAuthentication.GetCookies());
                HttpResponseMessage response = await client.SendAsync(request);
                response.EnsureSuccessStatusCode();
            }
            catch(Exception e)            
            {
                Trace.WriteLine($"Request error: {e.Message}");
            }

        }
    }

}
