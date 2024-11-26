using Bishop.Common.Service;
using Bishop.Common.Utils;
using System.Text.Json;
using Yoizen.Social.DomainModel;
using static Bishop.Common.Service.ConfigurationAgentsService;

namespace Bishop.Common.DAL
{
    public class YoizenAgentDAO
    {
        public static List<Agent> GetAListOfTestAgents()
        {
            string genContr = "asdQWE!23QWE";
            return new List<Agent>
            {
                new Agent { ID = 438, UserName = "qagent", Password = "asdQWE!23" },
                new Agent { ID = 283, UserName = "atroreyd", Password = genContr },
                new Agent { ID = 282, UserName = "aslingsbyc", Password = genContr },
                new Agent {ID = 295, UserName= "lthewys2", Password = genContr},
                new Agent {ID = 194, UserName= "mluque", Password = genContr},
                new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr},
                new Agent {ID = 271, UserName= "mpavelka", Password = genContr},
                new Agent {ID = 154, UserName= "marpe", Password = genContr},
                //new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr},
                //new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr},
                //new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr},
                //new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr},
                //new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr},
                //new Agent {ID = 264, UserName= "rjouaneton4", Password = genContr}
                // Añadir más agentes si es necesario
            };
        }

        public static Agent GetOneHardcoded()
        {
            return new Agent { ID = 438, UserName = "qagent", Password = "asdQWE!23" };
        }

        public static async Task<List<Agent>> GetAllFromAmbient()
        {
            List<Agent> agents = new List<Agent>();
            RetrieveAgentsResponseData retrieveAgentsDataResponse = await ConfigurationAgentsService.RetrieveAgents();

            foreach(var agent in retrieveAgentsDataResponse.Agents)
            {
                agents.Add(new Agent 
                { 
                    ID =  Convert.ToInt32(agent[0].ToString()),
                    UserName = agent[2].ToString(),
                });
            }

            return agents;
        }

        public static List<Agent> GetAListOfAgentsAndCredentialsFromCsv(string path)
        {
            List<Dictionary<string,string>> agentsList = CsvReader.ReadAgentsCredentialsFromCsv(path);
            List<Agent> agents = new List<Agent> { };
            foreach (Dictionary<string, string> agent in agentsList)
            {
                agents.Add(
                    new Agent
                    {
                        ID = Convert.ToInt32(agent["id"]),
                        UserName = agent["username"],
                        Password = agent["password"]

                    }); ;
            }

            return agents;
        }

        [Test]
        public void AgentsShouldBeLoaded()
        {
            string path = TestConfiguration.AgentsCsv;
            List<Agent> agents = GetAListOfAgentsAndCredentialsFromCsv(path);
        }
    }
}
