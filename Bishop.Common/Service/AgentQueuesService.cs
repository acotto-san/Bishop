using Bishop.Common.Actions;
using Bishop.Common.DAL;
using FluentAssertions;
using System.Diagnostics;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using Yoizen.Social.DomainModel;
using static Bishop.Common.Service.AgentQueuesService;
using static Bishop.Common.Service.SocialHttpRequestService;

namespace Bishop.Common.Service
{
    public class AgentQueuesService : BaseRequestService
    {

        internal class UpdateAgentQueuesRequestBuilder
        {
            private readonly UpdateAgentQueuesRequest _request;

            public UpdateAgentQueuesRequestBuilder(int agentId)
            {
                _request = new UpdateAgentQueuesRequest
                {
                    Id = agentId
                };
            }

            public UpdateAgentQueuesRequestBuilder WithQueues(IEnumerable<Queue> queues)
            {
                foreach (var queue in queues)
                {
                    _request.Queues[queue.Id] = queue.Priority;
                }
                return this;
            }

            public UpdateAgentQueuesRequestBuilder ApplyChanges(bool apply)
            {
                _request.Apply = apply;
                return this;
            }

            public UpdateAgentQueuesRequest Build()
            {
                return _request;
            }
        }

        internal class UpdateAgentQueuesRequest
        {
            [JsonPropertyName("type")]
            public int Type { get; set; } = 1;
            [JsonPropertyName("id")]
            public int Id { get; set; }
            [JsonPropertyName("queues")]
            public Dictionary<int, int> Queues { get; set; } = new();
            [JsonPropertyName("apply")]
            public bool Apply { get; set; } = false;
        }

        internal class Queue
        {
            public int Id { get; set; }
            public int Priority { get; set; }
        }

        public static async Task SaveQueues(List<Yoizen.Social.DomainModel.Queue> queues, Agent agent) 
        {

            List<Queue> queuesToBeAssigned = queues.Select(queue => new Queue { Id = queue.ID, Priority = 1 }).ToList();

            var body = new UpdateAgentQueuesRequestBuilder(agent.ID)
                .WithQueues(queuesToBeAssigned)
                .ApplyChanges(false)
                .Build();

            var jsonBody = JsonSerializer.Serialize(body);

            try
            {
                // Construir la solicitud POST
                var request = new HttpRequestMessage(HttpMethod.Post, TestConfiguration.SocialBaseUrl + "/Configuration/AgentsQueues.aspx/SaveQueues")
                {
                    Content = new StringContent(jsonBody, Encoding.UTF8, "application/json")
                };

                // Enviar la solicitud
                HttpResponseMessage response = await SendAuthenticatedRequestAsync(request);
                // Manejo de respuesta
                if (response.IsSuccessStatusCode)
                {
                    Trace.WriteLine($"Al agente {agent.UserName} se le esta asignando la cola {queuesToBeAssigned}");
                    Trace.WriteLine(await response.Content.ReadAsStringAsync());
                }
                else
                {
                    Trace.WriteLine($"Error: {response.StatusCode}, {await response.Content.ReadAsStringAsync()}");
                }
            }
            catch (Exception e)
            {
                Trace.WriteLine($"Request error: {e.Message}");
            }
        }
    }

}
