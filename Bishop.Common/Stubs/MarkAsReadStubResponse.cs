using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Common.Stubs
{
    public static class MarkAsReadStubResponse
    {
        public static string OriginalJson { get => "{\r\n  \"Success\": true,\r\n  \"Result\": null\r\n}"; }
        public static string GetOne()
        {
            return OriginalJson;
        }
    }
}
