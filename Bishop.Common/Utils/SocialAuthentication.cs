using Bishop.Common.Service;
using System.Diagnostics;
using System.Net;
using System.Text.RegularExpressions;

namespace Bishop.Common.Utils
{
    public class SocialAuthentication
    {
        static string cookieValue;
        public static async Task<string> GetCookies()
        {
            bool isCookieValid = await AssertThatCookieIsValid();
            if (cookieValue != null && isCookieValid)
            {
                Trace.TraceInformation("La cookie almacenada es válida, la reutilizo");
                return cookieValue;
            }
            else
            {
                Trace.TraceInformation("La cookie almacenada no es válida, se regenera");
            }
            cookieValue = await SocialHttpRequestService.LogInUserAndGetCookies(
                new NetworkCredential { UserName = "qadmin", Password = "asdQWE!23QWE" });

            if (cookieValue != null)
            {
                Trace.WriteLine($"Cookie value extracted: {cookieValue}");
                return cookieValue;
            }
            else
            {
                Trace.WriteLine("Failed to extract cookie.");
                return null;
            }
        }

        static async Task<bool> AssertThatCookieIsValid()
        {
            var request = new HttpRequestMessage(HttpMethod.Get, TestConfiguration.SocialBaseUrl) { };
            request.Headers.Add("cookie", $"yoizensocial={cookieValue}");
            var response = await HttpClientSingleton.Client.SendAsync(request);
            response.EnsureSuccessStatusCode();
            string jsonResponse = await response.Content.ReadAsStringAsync();
            string pattern = @"var\s+loggedUserID\s*=\s*\d+;";

            bool match = Regex.Match(jsonResponse, pattern).Success;
            return match;

        }
    }
}
