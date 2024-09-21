using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Driver;

namespace yTestFramework.Settings
{
    public class TestSettings
    {
        public BrowserType BrowserType { get; set; }

        public Uri? ApplicationUrl { get; set; }

        public int TimeoutInterval { get; set; }


    }


}
