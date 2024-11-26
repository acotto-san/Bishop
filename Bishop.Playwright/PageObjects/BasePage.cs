using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects
{
    public abstract class BasePage
    {
        protected readonly IPage _page;

        protected abstract string BaseUrl { get; }
        protected abstract string Endpoint { get; }

        public string FullUrl => $"{BaseUrl}{Endpoint}";

        public BasePage(IPage page)
        {
            _page = page;
        }
    }
}
