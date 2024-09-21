using Bishop.Screenplay.Abilities;
using Bishop.Screenplay.Elements;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using System;

namespace Bishop.Screenplay.Extensions
{
    /// <summary>
    /// Abstract class that makes it easier to write Tasks that use DoPayment Ability.
    /// </summary>
    public abstract class AbstactPaymentTask : ITask
    {
        #region Abstract Methods

        /// <summary>
        /// Performs the Task.
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        /// <param name="money">The Money from the DoPayment Ability.</param>
        public abstract void PerformAs(IActor actor, IMoney money);

        #endregion

        #region Methods

        /// <summary>
        /// Performs the Task.
        /// Internally calls PerformAs with the Money from the DoPayment Ability.
        /// </summary>
        /// <param name="actor">The Screenplay Actor.</param>
        public virtual void PerformAs(IActor actor) => PerformAs(actor, actor.Using<DoPayment>().Money);

        /// <summary>
        /// Checks if this interaction is equal to another interaction.
        /// </summary>
        /// <param name="obj">The other object.</param>
        /// <returns></returns>
        public override bool Equals(object obj) => obj.GetType().Equals(GetType());

        /// <summary>
        /// Gets a unique hash code for this interaction.
        /// </summary>
        /// <returns></returns>
        public override int GetHashCode() => HashCode.Combine(GetType());

        /// <summary>
        /// Returns a description of the Task.
        /// </summary>
        /// <returns></returns>
        public override string ToString() => GetType().Name;

        #endregion
    }
}
