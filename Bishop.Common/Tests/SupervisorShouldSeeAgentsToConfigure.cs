using Bishop.Common.DAL;
using Bishop.Common.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yoizen.Social.DomainModel;
using static Bishop.Common.Service.ConfigurationAgentsService;

namespace Bishop.Common.Tests
{
    public class SupervisorShouldSeeAgentsToConfigure
    {
        [Test]
        async public Task SupervisorAsksForAgentList()
        {
            List<Agent> agents = await YoizenAgentDAO.GetAllFromAmbient();
        }
    }
}
