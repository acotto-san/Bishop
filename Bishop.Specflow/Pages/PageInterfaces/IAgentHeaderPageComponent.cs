using OpenQA.Selenium;
using ySpecFlow.Models;

namespace ySpecFlow.Pages.PageInterfaces
{
    public interface IAgentHeaderComponentPage : IBasePageComponent
    {
        IEnumerable<IWebElement> ChatSlots { get; }
        List<AssignedMessageSlot> AssignedMessages { get; }

        public void PerformLogout(IAgentLoginPage loginPage);

        public void ChangeStatus(ConnectionStatuses status);
        bool IsAnyMessageAssigned();
    }
}