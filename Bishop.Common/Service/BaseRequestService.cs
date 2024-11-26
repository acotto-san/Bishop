using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using Bishop.Common.Service;
using Bishop.Common.Utils;

public abstract class BaseRequestService
{
    protected static async Task<HttpResponseMessage> SendRequestAsync(HttpMethod method, string endpoint, string content)
    {
        var request = new HttpRequestMessage(method, endpoint)
        {
            Content = new StringContent(content, Encoding.UTF8, "application/json")
        };
        return await SendRequestAsync(request);
    }

    protected static async Task<HttpResponseMessage> SendRequestAsync(HttpRequestMessage request)
    {
        Trace.WriteLine($"Se esta realizando una request HTTP a: {request.RequestUri}");
        HttpResponseMessage response = await HttpClientSingleton.Client.SendAsync(request);
        response.EnsureSuccessStatusCode(); // Lanza excepción si el código de estado no es exitoso.
        return response;
    }
    protected static async Task<HttpResponseMessage> SendAuthenticatedRequestAsync(HttpMethod method, string endpoint, string content)
    {
        var request = new HttpRequestMessage(method, endpoint)
        {
            Content = new StringContent(content, Encoding.UTF8, "application/json")
        };
        return await SendAuthenticatedRequestAsync(request);
    }

    protected static async Task<HttpResponseMessage> SendAuthenticatedRequestAsync(HttpRequestMessage request)
    {
        string yoizenCookie = await SocialAuthentication.GetCookies();
        request.Headers.Add("cookie", $"yoizensocial={yoizenCookie}");
        return await SendRequestAsync(request);
    }
}
