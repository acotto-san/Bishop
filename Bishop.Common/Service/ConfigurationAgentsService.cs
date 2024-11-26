using FluentAssertions;
using System.Diagnostics;
using System.Text;
using System.Text.Json;
using static Bishop.Common.Service.ConfigurationAgentsService;

namespace Bishop.Common.Service
{
    public class ConfigurationAgentsService : BaseRequestService
    {
        internal class RetrieveAgentsRootResponse
        {
            public RetrieveAgentsResponseData d { get; set; }
        }

        public class RetrieveAgentsResponseData
        {
            public bool Success { get; set; }
            public object[][] Agents { get; set; }
            public string[] Fields { get; set; }
        }

        public static async Task<RetrieveAgentsResponseData> RetrieveAgents()
        {
            try
            {
                var response = await SendAuthenticatedRequestAsync(HttpMethod.Post, $"{TestConfiguration.SocialBaseUrl}/Configuration/Agents.aspx/RetrieveAgents", "{}");

                if (response != null)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    var agentsResultData = JsonSerializer.Deserialize<RetrieveAgentsRootResponse>(jsonResponse)?.d;

                    if (agentsResultData == null)
                    {
                        Trace.WriteLine("Deserialization returned null.");
                    }
                    return agentsResultData;
                }
            }
            catch (Exception ex)
            {
                Trace.WriteLine($"Error al conseguir la tabla de configuracion de agentes: {ex.Message}");
            }
            return null; // O considera lanzar una excepción aquí.
        }

        public static async Task ChangeAgentPassword()
        {
            // Implementa el cambio de contraseña aquí
            List<KeyValuePair<string, string>> formData = new List<KeyValuePair<string, string>> { };
        }
        

    }

    public class ConfigurationAgentsServiceTests
    {
        [Test]
        public static async Task RetrieveAgentsShouldHaveAgentsTest()
        {
            RetrieveAgentsResponseData responseData = await RetrieveAgents();
            responseData.Agents.Should().HaveCountGreaterThan(0);
        }
    }

}
