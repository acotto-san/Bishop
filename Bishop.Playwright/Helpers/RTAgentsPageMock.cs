using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace Bishop.Playwright.Helpers
{
    static class RTAgentsPageMock
    {
        public class Agent
        {
            public int ID { get; set; }
            public string Name { get; set; }
            public string UserName { get; set; }
            public List<string> Queues { get; set; }
            public bool AtLeastOneQueueWithMessages { get; set; }
            public Status Status { get; set; }
            public Stats Stats { get; set; }
            public string Client { get; set; }
            public bool Outdated { get; set; }
            public string Version { get; set; }
            public string BrowserUserAgent { get; set; }
            public Site Site { get; set; }
            public TimeWithoutReading TimeWithoutReading { get; set; }
            public string IP { get; set; }
            public string AgentType { get; set; }
            public string AgentVersion { get; set; }
            public string SessionID { get; set; }
            public string Token { get; set; }
        }

        public class Status
        {
            public int StatusValue { get; set; }
            public int AuxReason { get; set; }
            public string AuxReasonName { get; set; }
            public double TimeInStatus { get; set; }
            public string TimeInStatusText { get; set; }
        }

        public class Stats
        {
            public double AuxTime { get; set; }
            public List<double> AuxTimes { get; set; }
        }

        public class Site
        {
            public int ID { get; set; }
            public string Name { get; set; }
        }

        public class TimeWithoutReading
        {
            public int Ticks { get; set; }
            public int Days { get; set; }
        }

        public class ResponseData
        {
            public string __type { get; set; }
            public bool Success { get; set; }
            public List<Agent> Agents { get; set; }
            public int TotalPages { get; set; }
            public int CurrentPage { get; set; }
            public string Error { get; set; }
            public Total Total { get; set; }   
            
        }

        public class RetrieveDataResponseBody
        {
            public ResponseData d { get; set; }

        }
        public class Total
        {
            public int CountAgents { get; set; }
            public double AvailableTime { get; set; }
            public string AvailableTimeText { get; set; }
            public double WorkingTime { get; set; }
            public string WorkingTimeText { get; set; }
            public double AuxTime { get; set; }
            public string AuxTimeText { get; set; }
            public List<AuxTimeDetail> AuxTimes { get; set; }
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

        public class AuxTimeDetail
        {
            public double Time { get; set; }
            public string Text { get; set; }
        }

        static Agent GenerateRandomAgent(int agentId)
        {
            Random random = new Random();
            return new Agent
            {
                ID = agentId,
                Name = $"Agent {agentId}",
                UserName = $"user{agentId}",
                Queues = new List<string> { "_Cola A" },
                AtLeastOneQueueWithMessages = true,
                Status = new Status
                {
                    StatusValue = 4,
                    AuxReason = 0,
                    AuxReasonName = "Login",
                    TimeInStatus = random.NextDouble() * 3600,
                    TimeInStatusText = TimeSpan.FromSeconds(random.NextDouble() * 3600).ToString(@"hh\:mm\:ss")
                },
                Stats = new Stats
                {
                    AuxTime = random.NextDouble() * 3600,
                    AuxTimes = new List<double> { random.NextDouble() * 3600 }
                },
                IP = $"172.16.0.{random.Next(1, 256)}",
                SessionID = random.Next(10000, 99999).ToString(),
                Token = $"{agentId}_172.16.0.{random.Next(1, 256)}_{Guid.NewGuid()}"
            };
        }

        public static RetrieveDataResponseBody GeneratePage(int actualPage, int totalPages)
        {
            var agents = new List<Agent>();
            int start = (actualPage - 1) * 50 + 1;
            int end = actualPage * 50;

            for (int i = start; i <= end; i++)
            {
                agents.Add(GenerateRandomAgent(i));
            }

            return new RetrieveDataResponseBody
            {
                d = new ResponseData
                {
                    __type = "Yoizen.Social.Web.Reports.RTAgentsModels.ResponseData",
                    Success = true,
                    Agents = agents,
                    Total = new Total
                    {
                        CountAgents = 50,
                        AvailableTime = 0,
                        AvailableTimeText = "-",
                        WorkingTime = 0,
                        WorkingTimeText = "-",
                        AuxTime = 0,
                        AuxTimeText = "-",
                        AuxTimes = new List<AuxTimeDetail>(),
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

            //// Serializar a JSON y guardar en un archivo
            //string outputFile = "agents_data.json";
            //var options = new JsonSerializerOptions { WriteIndented = true };
            //File.WriteAllText(outputFile, JsonSerializer.Serialize(responseData, options));

            //Console.WriteLine($"Archivo generado: {outputFile}");
        }
    }
}