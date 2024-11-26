using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Common.Service
{
    public static class HttpClientSingleton
    {
        private static readonly HttpClient _client;

        static HttpClientSingleton()
        {
            _client = new HttpClient{};
        }

        public static HttpClient Client { get => _client; }

    }
}
