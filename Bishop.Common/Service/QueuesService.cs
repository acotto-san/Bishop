using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yoizen.Social.DomainModel.Settings;

namespace Bishop.Common.Service
{
    public class QueuesService : BaseRequestService
    {

        //static public async Task<RetrieveQueuesResponseData> RetrieveQueues()
        //{
        //    HttpRequestMessage response;
        //    try
        //    {
        //        var request
        //    }
        //    return new RetrieveQueuesResponseData { };
        //}

        internal class RetrieveQueuesRootResponse
        {
            public RetrieveQueuesResponseData d { get; set; }
        }

        public class RetrieveQueuesResponseData
        {
            public bool Success { get; set; }
            public object[][] Queues { get; set; }
            public string[] Fields { get; set; }
        }
    }
}
