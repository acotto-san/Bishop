using Bishop.Screenplay.Pages;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;

namespace Bishop.Screenplay.Interactions
{
    public class LoadYFLowLoginPage : ITask
    {

        #region Constructors

        /// <summary>
        /// Private constructor.
        /// (Use static builder methods to construct.)
        /// </summary>
        private LoadYFLowLoginPage() { }

        #endregion


        #region Builder Methods

        /// <summary>
        /// Constructs the Task object for the given URL.
        /// </summary>
        /// <param name="url">The target URL.</param>
        /// <returns></returns>
        public static LoadYFLowLoginPage WithBrowser() => new LoadYFLowLoginPage();

        #endregion

        #region Methods

        /// <summary>
        /// Navigates into the default yFlow login page
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        public void PerformAs(IActor actor)
        {
            actor.AttemptsTo(Navigate.ToUrl(YFlowLogin.Url));
        }


        /// <summary>
        /// Returns a description of the Task.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"Navigates into the default yFlow login page";

        #endregion
    }
}
