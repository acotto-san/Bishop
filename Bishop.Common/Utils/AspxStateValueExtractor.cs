using HtmlAgilityPack;

namespace Bishop.Common.Utils
{
    public static class AspxStateValueExtractor
    {
        public static Dictionary<string, string> ExtractStateValues(string html)
        {
            var doc = new HtmlDocument();
            doc.LoadHtml(html);

            return new Dictionary<string, string>
            {
                { "__VIEWSTATE", doc.DocumentNode.SelectSingleNode("//input[@id='__VIEWSTATE']").Attributes["value"].Value },
                { "__VIEWSTATEGENERATOR", doc.DocumentNode.SelectSingleNode("//input[@id='__VIEWSTATEGENERATOR']").Attributes["value"].Value },
                { "__EVENTVALIDATION", doc.DocumentNode.SelectSingleNode("//input[@id='__EVENTVALIDATION']").Attributes["value"].Value }
            };
        }
    }
}
