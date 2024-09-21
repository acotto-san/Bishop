using Bishop.Screenplay.Elements;
using Boa.Constrictor.Screenplay;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Screenplay.Abilities
{
    /// <summary>
    /// Enables the Actor to use Money in a payment.
    /// </summary>
    public class DoPayment : IAbility
    {

        #region Constructors

        private DoPayment(Money money) 
        {
            Money = money;
        }

        #endregion

        #region Properties

        /// <summary>
        /// The Money Instance.
        /// </summary>
        public IMoney Money { get; internal set; }

        #endregion

        #region Builder Methods

        /// <summary>
        /// Constructs this object with the given Money.
        /// </summary>
        /// <param name="money">The money to be used in Payment related tasks.</param>
        /// <returns></returns>
        public static DoPayment With(Money money) => new DoPayment(money);

        #endregion

        #region Methods

        /// <summary>
        /// Returns a description of this Ability.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => $"do a payment transaction with {Money}";

        #endregion
    }
}
