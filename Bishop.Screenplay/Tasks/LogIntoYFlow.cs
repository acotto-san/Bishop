using Bishop.Screenplay.Interactions;
using Bishop.Screenplay.Pages;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;

namespace Bishop.Screenplay.Tasks
{
    public class LogIntoYFlow : AbstractWebTask
    {

        #region Constructors

        /// <summary>
        /// Private constructor.
        /// (Use static builder methods to construct.)
        /// </summary>
        private LogIntoYFlow() { }

        #endregion


        #region Builder Methods

        /// <summary>
        /// Constructs the Task object for the given URL.
        /// </summary>
        /// <returns></returns>
        public static LogIntoYFlow WithBrowser() => new LogIntoYFlow();

        #endregion

        #region Methods

        /// <summary>
        /// Performs a yFlow login
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        public override void PerformAs(IActor actor, IWebDriver driver)
        {
            actor.AttemptsTo(LoadYFLowLoginPage.WithBrowser());
            actor.AttemptsTo(FillYFlowLoginForm.WithCredentials(new PasswordCredentials("Qadmin","asdQWE!23"))); //TODO: crear una habilidad de loguearse
            actor.AttemptsTo(SubmitLoginWebForm.SendingEnterKeyPress(YFlowLogin.PasswordInput));
        }


        /// <summary>
        /// Returns a description of the Task.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"Performs a yFlow login";

        #endregion
    }
}
