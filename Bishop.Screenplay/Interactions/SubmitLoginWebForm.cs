using Bishop.Screenplay.Pages;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
namespace Bishop.Screenplay.Interactions
{
    /// <summary>
    /// Submit a login webform using WebBroser
    /// </summary>
    public class SubmitLoginWebForm : AbstractWebTask
    {

        #region Constructors

        /// <summary>
        /// Private constructor.
        /// (Use static builder methods to construct.)
        /// </summary>
        private SubmitLoginWebForm(SubmitMethod submitMethod, IWebLocator locator)
        {
            Method = submitMethod;
            Locator = locator;
        }

        #endregion

        #region Properties
        public enum SubmitMethod
        {
            EnterKeyPress,
            SubmitButtonClick
        }

        public SubmitMethod Method { get; private set; }

        public IWebLocator Locator { get; private set; }
        #endregion

        #region Builder Methods

        /// <summary>
        /// Constructs the Task object for the login form clicking on the submit button
        /// </summary>
        /// <param name="submitButton">The button to perform the click.</param>
        public static SubmitLoginWebForm ClickingSubmitButton(IWebLocator submitButton) => new SubmitLoginWebForm(SubmitMethod.SubmitButtonClick, submitButton);

        /// <summary>
        /// Constructs the Task object for the login form performing a Enter Keystroke being on top of the password field
        /// </summary>
        /// <param name="passWordField">The password field to click before sending the Keystroke.</param>
        public static SubmitLoginWebForm SendingEnterKeyPress(IWebLocator passWordField) => new SubmitLoginWebForm(SubmitMethod.EnterKeyPress, passWordField);


        #endregion

        #region Methods

        /// <summary>
        /// Use given credentials to fill the login form
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        public override void PerformAs(IActor actor, IWebDriver driver)
        {
            switch (Method)
            {
                case SubmitMethod.EnterKeyPress:
                    actor.AttemptsTo(Click.On(Locator));
                    actor.AttemptsTo(SendKeys.To(Locator, "").WithoutClearing().ThenHitEnter());
                    break;
                case SubmitMethod.SubmitButtonClick:
                    actor.AttemptsTo(Click.On(Locator));
                    break;
            }
        }


        /// <summary>
        /// Returns a description of the Task.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"Submitting a login form using '{Method}'";

        #endregion
    }
}
