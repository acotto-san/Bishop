using Bishop.Screenplay.Pages;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using static Boa.Constrictor.Selenium.WebLocator;

namespace Bishop.Screenplay.Tasks
{
    /// <summary>
    /// Find a flow card given by a text and perfoms a click to enter on the flow
    /// </summary>
    public class ClickOnFlowCard : ITask
    {

        #region Constructors
        /// <summary>
        /// Private constructor.
        /// (Use static builder methods to construct.)
        /// </summary>
        private ClickOnFlowCard(string text) => Text = text;

        #endregion

        #region Properties

        private string Text;

        #endregion


        public static ClickOnFlowCard WithText(string text) => new ClickOnFlowCard(text);


        public  void PerformAs(IActor actor)
        {
            actor.AttemptsTo(Click.On(FlowInDevelopmentCard.WholeCardByItsTitle(Text)));
        }
    }
}
