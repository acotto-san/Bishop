using OpenQA.Selenium;

namespace ySpecFlow.Models
{
    public interface IAssignedMessageSlot
    {
        string Date { get; set; }
        string Message { get; set; }
        string Queue { get; set; }
        string Sender { get; set; }
        string Service { get; set; }
        IWebElement ChatSlot { get; set; }
    }
}