using Bishop.Screenplay.Pages;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
namespace Bishop.Screenplay.Interactions
{
    /// <summary>
    /// Fills the login form of yFlow
    /// </summary>
    public class FillYFlowLoginForm : ITask
    {

        #region Constructors

        /// <summary>
        /// Private constructor.
        /// (Use static builder methods to construct.)
        /// </summary>
        private FillYFlowLoginForm(PasswordCredentials passwordCredentials) => PasswordCredentials = passwordCredentials;

        #endregion

        #region Properties

        /// <summary>
        /// The credentials to be used on the form
        /// </summary>
        public PasswordCredentials PasswordCredentials { get; }

        #endregion

        #region Builder Methods

        /// <summary>
        /// Constructs the Task object for the login form
        /// </summary>
        /// <returns></returns>
        public static FillYFlowLoginForm WithCredentials(PasswordCredentials passwordCredentials) => new FillYFlowLoginForm(passwordCredentials);

        #endregion

        #region Methods

        /// <summary>
        /// Use given credentials to fill the login form
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        public void PerformAs(IActor actor)
        {
            actor.AttemptsTo(SendKeys.To(YFlowLogin.UsernameInput, PasswordCredentials.UserName));
            actor.AttemptsTo(SendKeys.To(YFlowLogin.PasswordInput, PasswordCredentials.Password));
        }


        /// <summary>
        /// Returns a description of the Task.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"Fill login form with '{PasswordCredentials.UserName}' credentials";

        #endregion
    }
}
