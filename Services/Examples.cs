using IBM.Cloud.SDK.Core.Authentication.Iam;
using IBM.Watson.Assistant.v2;
using IBM.Watson.Assistant.v2.Model;

namespace DaelShop.Services
{
    public class Examples
    {
        public class ServiceExample
        {
            //string apikey = "WkER160BE_99iJi93bH3TQgi2l8tuhIdX0G1T-1TNGpd";
            //string url = "https://api.au-syd.assistant.watson.cloud.ibm.com/instances/387db4a2-fd5b-4c69-83a2-31d1dfbc8044";
            //string versionDate = "{versionDate}";
            //string assistantId = "079cb707-a927-493b-84fc-276606738809";
            //string sessionId;
            //string inputString = "hello";

            //static void Main(string[] args)
            //{
            //    ServiceExample example = new ServiceExample();

            //    example.CreateSession();
            //    example.Message();
            //    example.DeleteSession();

            //    Console.WriteLine("Examples complete. Press any key to close the application.");
            //    Console.ReadKey();
            //}

            //#region Sessions
            //public void CreateSession()
            //{
            //    IamAuthenticator authenticator = new IamAuthenticator(
            //        apikey: apikey);

            //    AssistantService service = new AssistantService("2020-04-01", authenticator);
            //    service.SetServiceUrl(url);

            //    var result = service.CreateSession(
            //        assistantId: assistantId
            //        );

            //    Console.WriteLine(result.Response);

            //    sessionId = result.Result.SessionId;
            //}

            //public void DeleteSession()
            //{
            //    IamAuthenticator authenticator = new IamAuthenticator(
            //        apikey: apikey);

            //    AssistantService service = new AssistantService("2020-04-01", authenticator);
            //    service.SetServiceUrl(url);

            //    var result = service.DeleteSession(
            //        assistantId: assistantId,
            //        sessionId: sessionId
            //        );

            //    Console.WriteLine(result.Response);
            //}
            //#endregion

            //#region Message
            //public void Message()
            //{
            //    IamAuthenticator authenticator = new IamAuthenticator(
            //        apikey: apikey);

            //    AssistantService service = new AssistantService("2020-04-01", authenticator);
            //    service.SetServiceUrl(url);

            //    var result = service.Message(
            //        assistantId: assistantId,
            //        sessionId: sessionId,
            //        input: new MessageInput()
            //        {
            //            Text = "Hello"
            //        }
            //        );

            //    Console.WriteLine(result.Response);
            //}
            //#endregion

            //#region Message with context
            //public void MessageWithContext()
            //{
            //    IamAuthenticator authenticator = new IamAuthenticator(
            //        apikey: apikey);

            //    AssistantService service = new AssistantService("2020-04-01", authenticator);
            //    service.SetServiceUrl(url);

            //    MessageContextSkills skills = new MessageContextSkills();
            //    Dictionary<string, object> userDefinedDictionary = new Dictionary<string, object>();

            //    userDefinedDictionary.Add("account_number", "123456");

            //    var result = service.Message(
            //        assistantId: assistantId,
            //        sessionId: sessionId,
            //        input: new MessageInput()
            //        {
            //            Text = "Hello"
            //        },
            //        context: new MessageContext()
            //        {
            //            Global = new MessageContextGlobal()
            //            {
            //                System = new MessageContextGlobalSystem()
            //                {
            //                    UserId = "my_user_id"
            //                }
            //            },
            //            Skills = skills
            //        }
            //        );

            //    Console.WriteLine(result.Response);
            //}
            //#endregion

            //#region Message Stateless
            //public void MessageStateless()
            //{
            //    IamAuthenticator authenticator = new IamAuthenticator(
            //        apikey: apikey);

            //    AssistantService service = new AssistantService("2020-04-01", authenticator);
            //    service.SetServiceUrl(url);

            //    var result = service.MessageStateless(
            //        assistantId: assistantId,
            //        input: new MessageInputStateless()
            //        {
            //            Text = "Hello"
            //        }
            //        );

            //    Console.WriteLine(result.Response);
            //}
            //#endregion
        }
    }
}
