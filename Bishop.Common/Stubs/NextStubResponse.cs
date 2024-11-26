using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Bishop.Common.Stubs
{
    public static class NextStubResponse
    {
        public static string OriginalJson { get => "{\r\n  \"Success\": true,\r\n  \"Result\": {\r\n    \"Messages\": [\r\n      {\r\n        \"ID\": 2000010941,\r\n        \"IDStr\": \"2000010941\",\r\n        \"SocialMessageID\": \"wamid.HBgNNTQ5MTE3MzY3NzEzNRUCABIYIEI4MTY3NTBEQkUyQUU5MTNDNTA3MEMzNzNERDQzMUEwAA==\",\r\n        \"Service\": {\r\n          \"ID\": 68,\r\n          \"Name\": \"Whatsapp Yoizen (2014) (Ventas)\"\r\n        },\r\n        \"PostedBy\": {\r\n          \"ID\": 5491173677135,\r\n          \"IDStr\": \"5491173677135\",\r\n          \"SocialServiceType\": 16,\r\n          \"Profile\": {\r\n            \"ID\": 6345\r\n          }\r\n        },\r\n        \"RepliesToSocialUser\": null,\r\n        \"RepliesTo\": null,\r\n        \"AssociatedMessage\": null,\r\n        \"Incoming\": true,\r\n        \"Body\": \"dfgh\",\r\n        \"EmptyBody\": false,\r\n        \"Date\": \"2024-09-30T11:01:47Z\",\r\n        \"InsertedDate\": \"2024-09-30T11:01:53.807Z\",\r\n        \"EnqueuedDate\": \"2024-09-30T11:01:54.04808Z\",\r\n        \"AssignedDate\": \"2024-09-30T12:26:10.3340077Z\",\r\n        \"ReadDate\": \"2024-09-30T11:02:45.2898766Z\",\r\n        \"FinishedReadDate\": \"2024-09-30T11:10:05.6759827Z\",\r\n        \"Status\": 2,\r\n        \"Delivered\": false,\r\n        \"DeliveryError\": null,\r\n        \"IsReply\": false,\r\n        \"AutoReplied\": false,\r\n        \"AssignedTo\": {\r\n          \"ID\": 438,\r\n          \"Type\": 2\r\n        },\r\n        \"RepliedBy\": null,\r\n        \"IsDirectMessage\": true,\r\n        \"Read\": false,\r\n        \"Queue\": {\r\n          \"ID\": 54\r\n        },\r\n        \"Important\": false,\r\n        \"ServiceType\": 6,\r\n        \"SocialServiceType\": 16,\r\n        \"DiscardReason\": null,\r\n        \"GroupedBy\": null,\r\n        \"IsGrouping\": false,\r\n        \"Groups\": null,\r\n        \"HasAttach\": false,\r\n        \"Attachments\": null,\r\n        \"Parameters\": {\r\n          \"MessageType\": \"1\",\r\n          \"SBus\": \"2024-09-30T11:01:49.0000000\",\r\n          \"SBusSId\": \"5491151992014_5491173677135\",\r\n          \"FEM\": \"True\",\r\n          \"APFAC\": \"True\",\r\n          \"ChatMode\": \"True\"\r\n        },\r\n        \"ReturnedToQueueDate\": null,\r\n        \"TimesReturnedToQueue\": 0,\r\n        \"Transferred\": false,\r\n        \"Moved\": false,\r\n        \"HasCoordinates\": false,\r\n        \"Chat\": null,\r\n        \"SocialVersion\": 2,\r\n        \"NumberOfSegments\": 2,\r\n        \"ProcessTime\": 7.04808,\r\n        \"QueueTime\": 0.0,\r\n        \"ReadTime\": 0.0,\r\n        \"ReadingTime\": 0.0,\r\n        \"WorkingTime\": 0.0,\r\n        \"AgentTime\": 0.0,\r\n        \"SystemTime\": 0.0,\r\n        \"OutOfServiceLevel\": false,\r\n        \"ContainsStructuredMessage\": false,\r\n        \"ContainsPayload\": false,\r\n        \"IsEvent\": false,\r\n        \"EventType\": null,\r\n        \"DiscardSource\": null,\r\n        \"ReplySource\": null,\r\n        \"SocialConversationID\": \"5491173677135\",\r\n        \"RepliesToSocialMessageID\": null,\r\n        \"OutOfSLL\": false\r\n      }\r\n    ],\r\n    \"SocialUserProfiles\": [\r\n      {\r\n        \"ID\": 6345,\r\n        \"SocialServiceTypesEnum\": 2056,\r\n        \"SocialServiceTypes\": [\r\n          2048,\r\n          8\r\n        ],\r\n        \"Name\": \"Santi unificado\",\r\n        \"PrimaryEmail\": \"mail@pepe.com\",\r\n        \"PrimaryPhoneNumber\": 5491173677135,\r\n        \"Anonymous\": false,\r\n        \"VIP\": false,\r\n        \"Blocked\": false,\r\n        \"Parameters\": {\r\n          \"Ext\": \"{\\\"adicionalPerfil\\\":\\\"dato 1\\\",\\\"segmento\\\":\\\"segmento 1\\\",\\\"fechaDeBloqueo\\\":\\\"2024-08-31\\\"}\"\r\n        },\r\n        \"MessagesSent\": 6797,\r\n        \"Cases\": 997,\r\n        \"BusinessData\": \"nacional-provincia-01#111,internacional-pepe#112\",\r\n        \"CreatedDate\": \"2021-02-09T21:08:37.477Z\",\r\n        \"LastInteractionDate\": \"2024-09-30T11:01:53.84Z\",\r\n        \"SocialUserAccounts\": [\r\n          {\r\n            \"ID\": 287,\r\n            \"IDStr\": \"287\",\r\n            \"IDBase64\": null,\r\n            \"SocialServiceType\": 4,\r\n            \"Name\": \"Santiago Manuel Acosta Ottonelli\",\r\n            \"FullName\": \"Santiago Manuel Acosta Ottonelli <acostaottonelli.santiago@gmail.com>\",\r\n            \"DisplayName\": \"Santiago Manuel Acosta Ottonelli\",\r\n            \"Email\": \"acostaottonelli.santiago@gmail.com\",\r\n            \"Anonymous\": false,\r\n            \"VIP\": false,\r\n            \"BusinessData\": \"nacional-provincia-01#111,internacional-pepe#112\",\r\n            \"MessagesSent\": 10,\r\n            \"LastInteractionDate\": \"2023-07-11T17:07:52.927Z\",\r\n            \"PreviousLastInteractionDate\": \"2023-06-30T13:44:27.29Z\",\r\n            \"Parameters\": {},\r\n            \"ParametersByService\": {}\r\n          },\r\n          {\r\n            \"ID\": 333,\r\n            \"IDStr\": \"333\",\r\n            \"IDBase64\": null,\r\n            \"SocialServiceType\": 8,\r\n            \"Name\": \"td03\",\r\n            \"FullName\": \"td03\",\r\n            \"DisplayName\": \"td03\",\r\n            \"Email\": \"\",\r\n            \"Anonymous\": false,\r\n            \"VIP\": false,\r\n            \"BusinessData\": \"nacional-provincia-01#111,internacional-pepe#112\",\r\n            \"MessagesSent\": 14,\r\n            \"LastInteractionDate\": \"2023-12-08T23:00:53.343Z\",\r\n            \"PreviousLastInteractionDate\": null,\r\n            \"Parameters\": {\r\n              \"NotAgrupable\": \"False\"\r\n            },\r\n            \"ParametersByService\": {}\r\n          },\r\n          {\r\n            \"ID\": 989898,\r\n            \"IDStr\": \"989898\",\r\n            \"IDBase64\": null,\r\n            \"SocialServiceType\": 8,\r\n            \"Name\": \"Santi\",\r\n            \"FullName\": \"Santi\",\r\n            \"DisplayName\": \"Santi\",\r\n            \"Email\": \"\",\r\n            \"Anonymous\": false,\r\n            \"VIP\": false,\r\n            \"BusinessData\": \"nacional-provincia-01#111,internacional-pepe#112\",\r\n            \"MessagesSent\": 12,\r\n            \"LastInteractionDate\": \"2023-07-05T17:30:35.62Z\",\r\n            \"PreviousLastInteractionDate\": null,\r\n            \"Parameters\": {},\r\n            \"ParametersByService\": {}\r\n          },\r\n          {\r\n            \"ID\": 5491173677135,\r\n            \"IDStr\": \"5491173677135\",\r\n            \"IDBase64\": null,\r\n            \"SocialServiceType\": 16,\r\n            \"Name\": \"Santiago\",\r\n            \"FullName\": \"Santiago (5491173677135)\",\r\n            \"DisplayName\": \"Santiago\",\r\n            \"Email\": null,\r\n            \"Anonymous\": false,\r\n            \"VIP\": false,\r\n            \"BusinessData\": \"nacional-provincia-01#111,internacional-pepe#112\",\r\n            \"MessagesSent\": 6742,\r\n            \"LastInteractionDate\": \"2024-09-30T11:01:53.84Z\",\r\n            \"PreviousLastInteractionDate\": \"2024-09-30T02:57:23.613Z\",\r\n            \"Parameters\": {\r\n              \"NotAgrupable\": \"False\",\r\n              \"ChatId\": \"5491173677135\",\r\n              \"AccountLinked\": \"True\",\r\n              \"AccountLinkedToken\": \"{\\\"pepe\\\":\\\"coso\\\"}\"\r\n            },\r\n            \"ParametersByService\": {\r\n              \"68\": {\r\n                \"ChatId\": \"5491173677135\",\r\n                \"NotAgrupable\": \"False\",\r\n                \"AccountLinked\": \"True\",\r\n                \"AccountLinkedToken\": \"{\\\"pepe\\\":\\\"coso\\\"}\"\r\n              }\r\n            }\r\n          },\r\n          {\r\n            \"ID\": 3846470675428843,\r\n            \"IDStr\": \"3846470675428843\",\r\n            \"IDBase64\": null,\r\n            \"SocialServiceType\": 2048,\r\n            \"Name\": \"Santiago Acosta Ottonelli\",\r\n            \"FullName\": \"Santiago Acosta Ottonelli\",\r\n            \"DisplayName\": \"Santiago Acosta Ottonelli\",\r\n            \"Email\": null,\r\n            \"Anonymous\": false,\r\n            \"VIP\": false,\r\n            \"BusinessData\": \"nacional-provincia-01#111,internacional-pepe#112\",\r\n            \"MessagesSent\": 19,\r\n            \"LastInteractionDate\": \"2023-12-08T23:19:03.03Z\",\r\n            \"PreviousLastInteractionDate\": \"2023-07-07T20:41:26.043Z\",\r\n            \"Parameters\": {\r\n              \"ProfileImageLocation\": \"https://graph.facebook.com/3846470675428843/picture?width=20000\",\r\n              \"ThreadId\": \"3846470675428843\",\r\n              \"ThreadLastUpdated\": \"2023-07-07T20:41:24.0000000\",\r\n              \"AvatarDownloadDateTime\": \"2024-09-26T18:28:10.0610377+00:00\"\r\n            },\r\n            \"ParametersByService\": {}\r\n          }\r\n        ],\r\n        \"Merged\": false\r\n      }\r\n    ],\r\n    \"Persons\": [\r\n      {\r\n        \"ID\": 438,\r\n        \"Type\": 2,\r\n        \"UserName\": \"qagent\",\r\n        \"FirstName\": \"QA\",\r\n        \"LastName\": \"Tester\",\r\n        \"Email\": \"sacostaottonelli+qagent@gmail.com\",\r\n        \"FullName\": \"QA Tester\",\r\n        \"DisplayName\": \"QA Tester (qagent)\"\r\n      }\r\n    ]\r\n  }\r\n}"; }

        public static Rootobject InstanciateOriginalJson()
        {
            return JsonSerializer.Deserialize<Rootobject>(OriginalJson);

        }

        public static string GetOneMessage()
        {
            return OriginalJson;
        }
        public class Rootobject
        {
            public bool Success { get; set; }
            public Result Result { get; set; }
        }

        public class Result
        {
            public Message[] Messages { get; set; }
            public Socialuserprofile[] SocialUserProfiles { get; set; }
            public Person[] Persons { get; set; }
        }

        public class Message
        {
            public int ID { get; set; }
            public string IDStr { get; set; }
            public string SocialMessageID { get; set; }
            public Service Service { get; set; }
            public Postedby PostedBy { get; set; }
            public object RepliesToSocialUser { get; set; }
            public object RepliesTo { get; set; }
            public object AssociatedMessage { get; set; }
            public bool Incoming { get; set; }
            public string Body { get; set; }
            public bool EmptyBody { get; set; }
            public DateTime Date { get; set; }
            public DateTime InsertedDate { get; set; }
            public DateTime EnqueuedDate { get; set; }
            public DateTime AssignedDate { get; set; }
            public int Status { get; set; }
            public bool Delivered { get; set; }
            public object DeliveryError { get; set; }
            public bool IsReply { get; set; }
            public bool AutoReplied { get; set; }
            public Assignedto AssignedTo { get; set; }
            public object RepliedBy { get; set; }
            public bool IsDirectMessage { get; set; }
            public bool Read { get; set; }
            public Queue Queue { get; set; }
            public bool Important { get; set; }
            public int ServiceType { get; set; }
            public int SocialServiceType { get; set; }
            public object DiscardReason { get; set; }
            public object GroupedBy { get; set; }
            public bool IsGrouping { get; set; }
            public object Groups { get; set; }
            public bool HasAttach { get; set; }
            public object Attachments { get; set; }
            public Parameters Parameters { get; set; }
            public object ReturnedToQueueDate { get; set; }
            public int TimesReturnedToQueue { get; set; }
            public bool Transferred { get; set; }
            public bool Moved { get; set; }
            public bool HasCoordinates { get; set; }
            public object Chat { get; set; }
            public int SocialVersion { get; set; }
            public int NumberOfSegments { get; set; }
            public float ProcessTime { get; set; }
            public float QueueTime { get; set; }
            public float ReadTime { get; set; }
            public float ReadingTime { get; set; }
            public float WorkingTime { get; set; }
            public float AgentTime { get; set; }
            public float SystemTime { get; set; }
            public bool OutOfServiceLevel { get; set; }
            public bool ContainsStructuredMessage { get; set; }
            public bool ContainsPayload { get; set; }
            public bool IsEvent { get; set; }
            public object EventType { get; set; }
            public object DiscardSource { get; set; }
            public object ReplySource { get; set; }
            public string SocialConversationID { get; set; }
            public object RepliesToSocialMessageID { get; set; }
            public bool OutOfSLL { get; set; }
        }

        public class Service
        {
            public int ID { get; set; }
            public string Name { get; set; }
        }

        public class Postedby
        {
            public long ID { get; set; }
            public string IDStr { get; set; }
            public int SocialServiceType { get; set; }
            public Profile Profile { get; set; }
        }

        public class Profile
        {
            public int ID { get; set; }
        }

        public class Assignedto
        {
            public int ID { get; set; }
            public int Type { get; set; }
        }

        public class Queue
        {
            public int ID { get; set; }
        }

        public class Parameters
        {
            public string MessageType { get; set; }
            public DateTime SBus { get; set; }
            public string SBusSId { get; set; }
            public string FEM { get; set; }
            public string APFAC { get; set; }
            public string ChatMode { get; set; }
        }

        public class Socialuserprofile
        {
            public int ID { get; set; }
            public int SocialServiceTypesEnum { get; set; }
            public int[] SocialServiceTypes { get; set; }
            public string Name { get; set; }
            public string PrimaryEmail { get; set; }
            public long PrimaryPhoneNumber { get; set; }
            public bool Anonymous { get; set; }
            public bool VIP { get; set; }
            public bool Blocked { get; set; }
            [JsonPropertyName("Parameters")]
            public SocialuserprofileParameters SocialuserprofileParameters { get; set; }
            public int MessagesSent { get; set; }
            public int Cases { get; set; }
            public string BusinessData { get; set; }
            public DateTime CreatedDate { get; set; }
            public DateTime LastInteractionDate { get; set; }
            public Socialuseraccount[] SocialUserAccounts { get; set; }
            public bool Merged { get; set; }
        }

        public class SocialuserprofileParameters
        {
            public string Ext { get; set; }
        }

        public class Socialuseraccount
        {
            public long ID { get; set; }
            public string IDStr { get; set; }
            public object IDBase64 { get; set; }
            public int SocialServiceType { get; set; }
            public string Name { get; set; }
            public string FullName { get; set; }
            public string DisplayName { get; set; }
            public string Email { get; set; }
            public bool Anonymous { get; set; }
            public bool VIP { get; set; }
            public string BusinessData { get; set; }
            public int MessagesSent { get; set; }
            public DateTime LastInteractionDate { get; set; }
            public DateTime? PreviousLastInteractionDate { get; set; }
            [JsonPropertyName("Parameters")]
            public SocialUserAccountParameters SocialUserAccountParameters { get; set; }
            public Parametersbyservice ParametersByService { get; set; }
        }

        public class SocialUserAccountParameters
        {
            public string NotAgrupable { get; set; }
            public string ChatId { get; set; }
            public string? AccountLinked { get; set; }
            public string AccountLinkedToken { get; set; }
            public string ProfileImageLocation { get; set; }
            public string ThreadId { get; set; }
            public DateTime ThreadLastUpdated { get; set; }
            public DateTime AvatarDownloadDateTime { get; set; }
        }

        public class Parametersbyservice
        {
            [JsonPropertyName("68")]
            public SocialUserAccountParametersByService paramByService { get; set; }
        }

        public class SocialUserAccountParametersByService
        {
            public string ChatId { get; set; }
            public string NotAgrupable { get; set; }
            public string AccountLinked { get; set; }
            public string AccountLinkedToken { get; set; }
        }

        public class Person
        {
            public int ID { get; set; }
            public int Type { get; set; }
            public string UserName { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Email { get; set; }
            public string FullName { get; set; }
            public string DisplayName { get; set; }
        }

    }
}
