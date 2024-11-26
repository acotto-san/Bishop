namespace Bishop.Common.Stubs
{
    public static class RetrieveDataStubResponse
    {
        public class AgentDTO
        {
            public int ID { get; set; }
            public string Name { get; set; }
            public string UserName { get; set; }
            public List<string> Queues { get; set; }
            public bool AtLeastOneQueueWithMessages { get; set; }
            public AgentStatusDTO Status { get; set; }
            public AgentStatsDTO Stats { get; set; }
            public string Client { get; set; }
            public bool Outdated { get; set; }
            public string Version { get; set; }
            public string BrowserUserAgent { get; set; }
            public SiteDTO Site { get; set; }
            public TimeWithoutReadingDTO TimeWithoutReading { get; set; }
            public string IP { get; set; }
            public string AgentType { get; set; }
            public string AgentVersion { get; set; }
            public string SessionID { get; set; }
            public string Token { get; set; }
        }

        public class AgentStatusDTO
        {
            public int Status { get; set; }
            public int AuxReason { get; set; }
            public string AuxReasonName { get; set; }
            public double TimeInStatus { get; set; }
            public string TimeInStatusText { get; set; }
            public int AssignedMessages { get; set; }
            public int ReadMessages { get; set; }
            public int UnreadMessages { get; set; }
            public int MaxAssignableMessages { get; set; }
            public int ReservedMessages { get; set; }
            public int TMO { get; set; }
            public int TML { get; set; }
            public int TMNL { get; set; }
            public int TxH { get; set; }
            public int RxH { get; set; }
            public int AgentTime { get; set; }
        }

        public class AgentStatsDTO
        {
            public double AuxTime { get; set; }
            public List<double> AuxTimes { get; set; }
        }

        public class SiteDTO
        {
            public int ID { get; set; }
            public string Name { get; set; }
        }

        public class TimeWithoutReadingDTO
        {
            public int Ticks { get; set; }
            public int Days { get; set; }
        }

        public class ResponseDataDTO
        {
            public string __type { get; set; }
            public bool Success { get; set; }
            public List<AgentDTO> Agents { get; set; }
            public int TotalPages { get; set; }
            public int CurrentPage { get; set; }
            public string Error { get; set; }
            public RTAgentsTotalDTO Total { get; set; }

        }

        public class RetrieveDataResponseBodyDTO
        {
            public ResponseDataDTO d { get; set; }

        }
        public class RTAgentsTotalDTO
        {
            public int CountAgents { get; set; }
            public double AvailableTime { get; set; }
            public string AvailableTimeText { get; set; }
            public double WorkingTime { get; set; }
            public string WorkingTimeText { get; set; }
            public double AuxTime { get; set; }
            public string AuxTimeText { get; set; }
            public List<AuxTimeDetailDTO> AuxTimes { get; set; }
            public double TotalTime { get; set; }
            public string TotalTimeText { get; set; }
            public int AssignedMessages { get; set; }
            public int RepliedMessages { get; set; }
            public int DiscardedMessages { get; set; }
            public int UnassignedMessages { get; set; }
            public int ReturnedToQueueMessages { get; set; }
            public int FinishedMessages { get; set; }
            public int AttendedMessages { get; set; }
            public int ReservedMessages { get; set; }
        }

        public class AuxTimeDetailDTO
        {
            public double Time { get; set; }
            public string Text { get; set; }
        }

        static AgentDTO GenerateRandomAgent(int agentId)
        {
            Random random = new Random();
            return new AgentDTO
            {
                ID = agentId,
                Name = $"Agent {agentId}",
                UserName = $"user{agentId}",
                Queues = new List<string> { "_Cola A" },
                AtLeastOneQueueWithMessages = true,
                Site = new SiteDTO
                {
                    Name = "pocho",
                    ID = 123
                },
                Status = new AgentStatusDTO
                {
                    Status = 4,
                    AuxReason = 0,
                    AuxReasonName = "Login",
                    TimeInStatus = random.NextDouble() * 3600,
                    TimeInStatusText = TimeSpan.FromSeconds(random.NextDouble() * 3600).ToString(@"hh\:mm\:ss")
                },
                Stats = new AgentStatsDTO
                {
                    AuxTime = random.NextDouble() * 3600,
                    AuxTimes = new List<double> { random.NextDouble() * 3600 }
                },
                IP = $"172.16.0.{random.Next(1, 256)}",
                SessionID = random.Next(10000, 99999).ToString(),
                Token = $"{agentId}_172.16.0.{random.Next(1, 256)}_{Guid.NewGuid()}"
            };
        }

        public static RetrieveDataResponseBodyDTO GeneratePage(int actualPage, int totalPages)
        {
            var agents = new List<AgentDTO>();
            int start = (actualPage - 1) * 50 + 1;
            int end = actualPage * 50;

            for (int i = start; i <= end; i++)
            {
                agents.Add(GenerateRandomAgent(i));
            }

            return new RetrieveDataResponseBodyDTO
            {
                d = new ResponseDataDTO
                {
                    __type = "Yoizen.Social.Web.Reports.RTAgentsModels.ResponseData",
                    Success = true,
                    Agents = agents,
                    Total = new RTAgentsTotalDTO
                    {
                        CountAgents = 50,
                        AvailableTime = 0,
                        AvailableTimeText = "-",
                        WorkingTime = 0,
                        WorkingTimeText = "-",
                        AuxTime = 0,
                        AuxTimeText = "-",
                        AuxTimes = new List<AuxTimeDetailDTO>(),
                        TotalTime = 0,
                        TotalTimeText = "-",
                        AssignedMessages = 0,
                        RepliedMessages = 0,
                        DiscardedMessages = 0,
                        UnassignedMessages = 0,
                        ReturnedToQueueMessages = 0,
                        FinishedMessages = 0,
                        AttendedMessages = 0,
                        ReservedMessages = 0
                    },
                    TotalPages = totalPages,
                    CurrentPage = actualPage,
                    Error = null
                }
            };


        }
    }
}