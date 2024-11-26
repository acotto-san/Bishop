using Bishop.Common.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yoizen.Social.DomainModel;

namespace Bishop.Common.Actions
{
    public static class LogOut
    {
        public static async Task AgentByEndpoint(int agentId)
        {
            await SocialHttpRequestService.DisconnectAgentFromRTAgents(agentId);
        }
        public static async Task AgentByEndpoint(Agent agent)
        {
            await AgentByEndpoint(agent.ID);
        }

        public static async Task MultipleAgentsByEndpoint(List<Agent> agentsList)
        {
            foreach (Agent agent in agentsList)
            {
                await AgentByEndpoint(agent.ID);
            }
        }
    }
}
