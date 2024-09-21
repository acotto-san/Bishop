using Bishop.Screenplay.Elements;
using Bishop.Screenplay.Extensions;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Screenplay.Tasks
{
    /// <summary>
    /// Pays for internet
    /// </summary>
    public class PayInternet : AbstactPaymentTask
    {
        #region Constructors

        /// <summary>
        /// Private constructor.
        /// (Use static builder methods to construct.)
        /// </summary>
        private PayInternet() {}

        #endregion

        #region Properties

        /// <summary>
        /// The money to be used in the payment
        /// </summary>
        private IMoney Money { get; set; }

        #endregion

        #region Builder Methods

        /// <summary>
        /// Constructs the Task object for the given URL.
        /// </summary>
        /// <param name="url">The target URL.</param>
        /// <returns></returns>
        public static PayInternet Now() => new PayInternet();

        #endregion

        #region Methods

        /// <summary>
        /// Pays for internet with money.
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        /// <param name="money">The money.</param>
        public override void PerformAs(IActor actor, IMoney money) {
            Money = money;
            money.Quantity -= 10;
        }

        /// <summary>
        /// Checks if this interaction is equal to another interaction.
        /// </summary>
        /// <param name="obj">The other object.</param>
        public override bool Equals(object obj) =>
            obj is PayInternet payInternet && Money == payInternet.Money;

        /// <summary>
        /// Gets a unique hash code for this interaction.
        /// </summary>
        /// <returns></returns>
        public override int GetHashCode() => HashCode.Combine(GetType(), Money);

        /// <summary>
        /// Returns a description of the Task.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"Pays internet and keeps the remaining'";

        #endregion
    }
}
