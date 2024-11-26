using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects
{
    public abstract class BaseWebComponent
    {
        protected readonly IPage _page;

        public BaseWebComponent(IPage page)
        {
            _page = page;
        }
    }
}
