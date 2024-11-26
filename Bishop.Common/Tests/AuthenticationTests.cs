using Bishop.Common.Actions;
using Bishop.Common.Utils;
using FluentAssertions;

namespace Bishop.Common.Tests
{
    public class AuthenticationTests
    {
        [Test]
        public async Task WhenSupervisorLogsInACookieIsGiven()
        {
            string cookies = await SocialAuthentication.GetCookies();
            cookies.Should().NotBeEmpty();
        }

        [Test]
        public async Task DisconnectAgent()
        {
            await LogOut.AgentByEndpoint(438);
        }
    }
}
