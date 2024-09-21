namespace ySpecFlow.BaseInterfaces
{
    public interface IProfileListPage : IBasePage
    {
        private void PerformClickOnSpecialValue(string columnName, string value, int specialControlIndex) { }
        public void DeleteElementOnListByName(ISocialUserProfile socialUserProfile) { }
        void DeleteFirstElementOnList();

    }

}
