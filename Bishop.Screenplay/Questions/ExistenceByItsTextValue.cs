using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using FluentAssertions;


namespace Bishop.Screenplay.Questions
{

    /// <summary>
    /// Gets a Web element's existence.
    /// "Existence" means that the element is present in the DOM.
    /// Note that an element can exist without being displayed.
    /// Warning: This method does NOT wait for the element to exist first!
    /// </summary>
    public class ExistenceByItsTextValue : AbstractWebLocatorQuestion<bool>
    {
        #region Constructors

        /// <summary>
        /// Private constructor.
        /// (Use static methods for public construction.)
        /// </summary>
        /// <param name="locator">The target Web element's locator.</param>
        /// <param name="expectedText">The text to make the query</param>
        private ExistenceByItsTextValue(IWebLocator locator, string expectedText) : base(locator)
        {
            ExpectedText = expectedText;
        }

        #endregion


        #region Properties

        /// <summary>
        /// The text that will be used to identify if an element is present
        /// </summary>
        public string ExpectedText;

        #endregion

        #region Builder Methods

        /// <summary>
        /// Constructs the Question.
        /// </summary>
        /// <param name="locator">The target Web element's locator.</param>
        /// <returns></returns>
        public static ExistenceByItsTextValue Of(IWebLocator locator,string expectedText) => new ExistenceByItsTextValue(locator, expectedText);

        #endregion

        #region Methods

        /// <summary>
        /// Returns true if at least one element exists on the page for the locator and has by text the string provided; false otherwise.
        /// "Existence" means that the element is present in the DOM.
        /// Note that an element can exist without being displayed.
        /// Warning: This method does NOT wait for the element to exist first!
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        /// <param name="driver">The WebDriver.</param>
        /// <returns></returns>
        public override bool RequestAs(IActor actor, IWebDriver driver)
        {
            ReadOnlyCollection<IWebElement> locatedElements = Locator.FindElements(driver);
            
            bool elementExists = locatedElements.Any(element => element.Text.Contains(ExpectedText));

            // Usa FluentAssertions para validar que al menos un elemento contiene el texto
            elementExists.Should().BeTrue($"Expected at least one element to contain the text'{ExpectedText}'");

            return elementExists;

        }

        /// <summary>
        /// Returns a description of the Question.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"existence of '{Locator.Description}'";

        #endregion
    }
}
