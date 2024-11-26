using Bishop.Common.DAL;
using Bishop.Common.Service;
using Bishop.Common.Utils;
using System.Diagnostics;
using Yoizen.Social.DomainModel;

namespace Bishop.Common.Tests
{
    public class AgentQueueServiceTests
    {
        [Test]
        public async Task SaveQueuesTest()
        {
            await AgentQueuesService.SaveQueues(
                new List<Yoizen.Social.DomainModel.Queue>
                {
                    new Yoizen.Social.DomainModel.Queue
                    {
                        ID = 54
                    },
                    new Yoizen.Social.DomainModel.Queue
                    {
                        ID = 57
                    },
                },
                YoizenAgentDAO.GetOneHardcoded()
                );
        }

        [Test]
        public async Task SaveSameQueueToAllAgents()
        {
            //conseguir una lista de agentes
            //List<Agent> agents = YoizenAgentDAO.GetAListOfAgentsOutOfIDsFromCsv(@"C:\Users\Santiago\Downloads\agentsCSV.csv");
            List<Agent> agents = await YoizenAgentDAO.GetAllFromAmbient();

            //de todos esos agentes, asignarles la siguiente cola
            foreach (Agent agent in agents)
            {
                await AgentQueuesService.SaveQueues(
                    new List<Yoizen.Social.DomainModel.Queue>
                    {
                        new Yoizen.Social.DomainModel.Queue
                        {
                            ID = 3
                        }
                    },
                    agent
                    );
            }
        }

        [Test]
        public async Task SaveSameQueueToDua()
        {

            await AgentQueuesService.SaveQueues(
                new List<Yoizen.Social.DomainModel.Queue>
                {
                        new Yoizen.Social.DomainModel.Queue
                        {
                            ID = 3
                        }
                },
                new Agent
                    {
                        ID= 499
                    }
                );
        }

        [Test]
        [TestCaseSource(nameof(GetAgents))]
        public async Task AssignQueueToAgent(Agent agent)
        {
            await AgentQueuesService.SaveQueues(
                new List<Yoizen.Social.DomainModel.Queue>
                {
                        new Yoizen.Social.DomainModel.Queue
                        {
                            ID = 54
                        }
                },
                agent
                );
        }

        static public IEnumerable<Agent> GetAgents()
        {
            return YoizenAgentDAO.GetAListOfAgentsAndCredentialsFromCsv(TestConfiguration.AgentsCsv);
        }

    }
}
