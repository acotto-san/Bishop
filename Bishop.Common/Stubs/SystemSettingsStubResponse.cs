using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Bishop.Common.Stubs
{
    public static class SystemSettingsStubResponse
    {
        private class ResponseDTO
        {
            [JsonPropertyName("Success")]
            public bool Success { get; set; }

            [JsonPropertyName("Result")]
            public ResultDTO Result { get; set; }
        }

        private class ResultDTO
        {
            [JsonPropertyName("MinimumPasswordStrength")]
            public int MinimumPasswordStrength { get; set; }

            [JsonPropertyName("UserPasswordExpireDay")]
            public int UserPasswordExpireDay { get; set; }

            [JsonPropertyName("UserPasswordRepeat")]
            public bool UserPasswordRepeat { get; set; }

            [JsonPropertyName("UserPasswordRepeatAmount")]
            public int UserPasswordRepeatAmount { get; set; }

            [JsonPropertyName("UserPasswordWrongBlock")]
            public int UserPasswordWrongBlock { get; set; }

            [JsonPropertyName("UserPasswordWrongsCaptha")]
            public int UserPasswordWrongsCaptha { get; set; }

            [JsonPropertyName("DaysInactiveUserBlock")]
            public int DaysInactiveUserBlock { get; set; }

            [JsonPropertyName("UserPasswordRefresh")]
            public bool UserPasswordRefresh { get; set; }

            [JsonPropertyName("UserPasswordFirstChange")]
            public bool UserPasswordFirstChange { get; set; }

            [JsonPropertyName("UserPasswordValidationRegex")]
            public string UserPasswordValidationRegex { get; set; }

            [JsonPropertyName("UserPasswordMessageRegex")]
            public string UserPasswordMessageRegex { get; set; }

            [JsonPropertyName("MinimumAgentPasswordStrength")]
            public int MinimumAgentPasswordStrength { get; set; }

            [JsonPropertyName("AgentPasswordExpireDay")]
            public int AgentPasswordExpireDay { get; set; }

            [JsonPropertyName("AgentPasswordRepeat")]
            public bool AgentPasswordRepeat { get; set; }

            [JsonPropertyName("AgentPasswordRepeatAmount")]
            public int AgentPasswordRepeatAmount { get; set; }

            [JsonPropertyName("AgentPasswordWrongsBlock")]
            public int AgentPasswordWrongsBlock { get; set; }

            [JsonPropertyName("AgentPasswordWrongsCaptha")]
            public int AgentPasswordWrongsCaptha { get; set; }

            [JsonPropertyName("DaysInactiveAgentBlock")]
            public int DaysInactiveAgentBlock { get; set; }

            [JsonPropertyName("AgentCanChangePassword")]
            public bool AgentCanChangePassword { get; set; }

            [JsonPropertyName("AgentPasswordRefresh")]
            public bool AgentPasswordRefresh { get; set; }

            [JsonPropertyName("AgentPasswordFirstChange")]
            public bool AgentPasswordFirstChange { get; set; }

            [JsonPropertyName("AgentPasswordValidationRegex")]
            public string AgentPasswordValidationRegex { get; set; }

            [JsonPropertyName("AgentPasswordMessageRegex")]
            public string AgentPasswordMessageRegex { get; set; }

            [JsonPropertyName("UseSentDate")]
            public bool UseSentDate { get; set; }

            [JsonPropertyName("AutoMarkAsReadMessages")]
            public bool AutoMarkAsReadMessages { get; set; }

            [JsonPropertyName("MaxAssignableMessagesPerUser")]
            public int MaxAssignableMessagesPerUser { get; set; }

            [JsonPropertyName("SessionTimeOut")]
            public int SessionTimeOut { get; set; }

            [JsonPropertyName("WarnAgentForSpellingErrors")]
            public bool WarnAgentForSpellingErrors { get; set; }

            [JsonPropertyName("AllowAgentToBlockUsers")]
            public bool AllowAgentToBlockUsers { get; set; }

            [JsonPropertyName("AgentMustEnterDiscardReason")]
            public bool AgentMustEnterDiscardReason { get; set; }

            [JsonPropertyName("AllowAgentsToReturnMessagesToQueue")]
            public bool AllowAgentsToReturnMessagesToQueue { get; set; }

            [JsonPropertyName("AgentMustEnterReturnToQueueReason")]
            public bool AgentMustEnterReturnToQueueReason { get; set; }

            [JsonPropertyName("MaximumNumberOfTimesMessageCanBeReturned")]
            public int MaximumNumberOfTimesMessageCanBeReturned { get; set; }

            [JsonPropertyName("AllowAgentsToSelectQueueOnReturnToQueue")]
            public bool AllowAgentsToSelectQueueOnReturnToQueue { get; set; }

            [JsonPropertyName("AllowAgentsToReturnMessagesWithRelatedMessagesToQueue")]
            public bool AllowAgentsToReturnMessagesWithRelatedMessagesToQueue { get; set; }

            [JsonPropertyName("OutgoingMessagesEnabled")]
            public bool OutgoingMessagesEnabled { get; set; }

            [JsonPropertyName("ServicesToWarnForMessages")]
            public string ServicesToWarnForMessages { get; set; }

            [JsonPropertyName("AuxReasonForOutgoingMessages")]
            public int AuxReasonForOutgoingMessages { get; set; }

            [JsonPropertyName("AuthenticationType")]
            public int AuthenticationType { get; set; }

            [JsonPropertyName("LDAP.UseLDAP")]
            public bool LdapUseLdap { get; set; }

            [JsonPropertyName("GoogleAuth.Enabled")]
            public bool GoogleAuthEnabled { get; set; }

            [JsonPropertyName("GoogleAuth.UseCustom")]
            public bool GoogleAuthUseCustom { get; set; }

            [JsonPropertyName("GoogleAuth.ClientId")]
            public string GoogleAuthClientId { get; set; }

            [JsonPropertyName("GoogleAuth.ClientSecret")]
            public string GoogleAuthClientSecret { get; set; }

            [JsonPropertyName("GoogleAuth.AllowCreateLocalAgents")]
            public bool GoogleAuthAllowCreateLocalAgents { get; set; }

            [JsonPropertyName("GoogleAuth.AllowCreateLocalUsers")]
            public bool GoogleAuthAllowCreateLocalUsers { get; set; }

            [JsonPropertyName("GoogleAuth.HostedDomain")]
            public string GoogleAuthHostedDomain { get; set; }

            [JsonPropertyName("Keycloak.Enabled")]
            public bool KeycloakEnabled { get; set; }

            [JsonPropertyName("Keycloak.RealmName")]
            public string KeycloakRealmName { get; set; }

            [JsonPropertyName("Keycloak.ClientSecret")]
            public string KeycloakClientSecret { get; set; }

            [JsonPropertyName("Keycloak.ClientName")]
            public string KeycloakClientName { get; set; }

            [JsonPropertyName("Keycloak.AllowCreateLocalAgents")]
            public bool KeycloakAllowCreateLocalAgents { get; set; }

            [JsonPropertyName("Keycloak.AllowCreateLocalUsers")]
            public bool KeycloakAllowCreateLocalUsers { get; set; }

            [JsonPropertyName("Keycloak.ClientEndpoint")]
            public string KeycloakClientEndpoint { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.UseUrlLogin")]
            public bool WebAgentUrlLoginSettingsUseUrlLogin { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.UserName")]
            public string WebAgentUrlLoginSettingsUserName { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.HashParam")]
            public string WebAgentUrlLoginSettingsHashParam { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.KeyToHash")]
            public string WebAgentUrlLoginSettingsKeyToHash { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.PasswordRequired")]
            public bool WebAgentUrlLoginSettingsPasswordRequired { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.RemoveLoginForm")]
            public bool WebAgentUrlLoginSettingsRemoveLoginForm { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.LogoutAction")]
            public int WebAgentUrlLoginSettingsLogoutAction { get; set; }

            [JsonPropertyName("WebAgentUrlLoginSettings.RemoveLogoutButton")]
            public bool WebAgentUrlLoginSettingsRemoveLogoutButton { get; set; }

            [JsonPropertyName("StateManagementSettings.AllowChangeState")]
            public bool StateManagementSettingsAllowChangeState { get; set; }

            [JsonPropertyName("StateManagementSettings.AllowLogoutInvoke")]
            public bool StateManagementSettingsAllowLogoutInvoke { get; set; }

            [JsonPropertyName("Cases.CheckLastQueueOfOpenCase")]
            public bool CasesCheckLastQueueOfOpenCase { get; set; }

            [JsonPropertyName("Cases.MaxElapsedMinutesToCloseCases")]
            public int CasesMaxElapsedMinutesToCloseCases { get; set; }

            [JsonPropertyName("Cases.AutoReplyInCloseCaseText")]
            public string CasesAutoReplyInCloseCaseText { get; set; }

            [JsonPropertyName("Cases.AllowToAutoReplyCloseCases")]
            public bool CasesAllowToAutoReplyCloseCases { get; set; }

            [JsonPropertyName("Cases.TagOnAutoCloseCase")]
            public int CasesTagOnAutoCloseCase { get; set; }

            [JsonPropertyName("Cases.MaxElapsedMinutesToCloseHsmCases")]
            public int CasesMaxElapsedMinutesToCloseHsmCases { get; set; }

            [JsonPropertyName("Cases.TagOnAutoCloseHsmCases")]
            public int CasesTagOnAutoCloseHsmCases { get; set; }

            [JsonPropertyName("Cases.MaxElapsedMinutesToCloseYFlowCases")]
            public int CasesMaxElapsedMinutesToCloseYFlowCases { get; set; }

            [JsonPropertyName("Cases.InvokeYFlowWhenClosedCases")]
            public bool CasesInvokeYFlowWhenClosedCases { get; set; }

            [JsonPropertyName("Cases.TagCasesOnStart")]
            public int CasesTagCasesOnStart { get; set; }

            [JsonPropertyName("Cases.AlwaysUpdateCase")]
            public bool CasesAlwaysUpdateCase { get; set; }

            [JsonPropertyName("Cases.TagCasesOnClose")]
            public int CasesTagCasesOnClose { get; set; }

            [JsonPropertyName("Cases.TagCasesOnDiscard")]
            public int CasesTagCasesOnDiscard { get; set; }

            [JsonPropertyName("Cases.ImportantTag")]
            public bool CasesImportantTag { get; set; }

            [JsonPropertyName("Cases.IgnoreLastQueueForSLMovedMessage")]
            public bool CasesIgnoreLastQueueForSlMovedMessage { get; set; }

            [JsonPropertyName("Cases.AllowToAddMessagesToCasesWithMessagesInQueue")]
            public bool CasesAllowToAddMessagesToCasesWithMessagesInQueue { get; set; }

            [JsonPropertyName("Cases.AllowNotificationWhenClosePendingCase")]
            public bool CasesAllowNotificationWhenClosePendingCase { get; set; }

            [JsonPropertyName("Cases.ImportantTagOutgoing")]
            public bool CasesImportantTagOutgoing { get; set; }

            [JsonPropertyName("Cases.TagOutgoing")]
            public bool CasesTagOutgoing { get; set; }

            [JsonPropertyName("InternalChat.AgentConnectionUrl")]
            public string InternalChatAgentConnectionUrl { get; set; }

            [JsonPropertyName("Whatsapp.DefaultInternationCode")]
            public int WhatsappDefaultInternationCode { get; set; }

            [JsonPropertyName("Whatsapp.MaxMinutesToAnswerMessages")]
            public int WhatsappMaxMinutesToAnswerMessages { get; set; }

            [JsonPropertyName("Twitter.DmTextCharacterLimit")]
            public int TwitterDmTextCharacterLimit { get; set; }

            [JsonPropertyName("Twitter.StatusTextCharacterLimit")]
            public int TwitterStatusTextCharacterLimit { get; set; }

            [JsonPropertyName("Twitter.CharactersReservedPerMedia")]
            public int TwitterCharactersReservedPerMedia { get; set; }

            [JsonPropertyName("Twitter.MaxMediaPerUpload")]
            public int TwitterMaxMediaPerUpload { get; set; }

            [JsonPropertyName("Twitter.PhotoSizeLimit")]
            public int TwitterPhotoSizeLimit { get; set; }

            [JsonPropertyName("Twitter.ShortUrlLength")]
            public int TwitterShortUrlLength { get; set; }

            [JsonPropertyName("Twitter.ShortUrlLengthHttps")]
            public int TwitterShortUrlLengthHttps { get; set; }

            [JsonPropertyName("Twitter.AllowMentionInMultipleServices")]
            public bool TwitterAllowMentionInMultipleServices { get; set; }

            [JsonPropertyName("FacebookMessenger.MaxMinutesToAnswerMessages")]
            public int FacebookMessengerMaxMinutesToAnswerMessages { get; set; }

            [JsonPropertyName("SMS.DefaultInternationCode")]
            public int SmsDefaultInternationCode { get; set; }

            [JsonPropertyName("Instagram.MaxMinutesToAnswerMessages")]
            public int InstagramMaxMinutesToAnswerMessages { get; set; }

            [JsonPropertyName("ForwardMessage.FacebookSubject")]
            public string ForwardMessageFacebookSubject { get; set; }

            [JsonPropertyName("ForwardMessage.FacebookMessengerSubject")]
            public string ForwardMessageFacebookMessengerSubject { get; set; }

            [JsonPropertyName("ForwardMessage.TwitterSubject")]
            public string ForwardMessageTwitterSubject { get; set; }

            [JsonPropertyName("ForwardMessage.WhatsappSubject")]
            public string ForwardMessageWhatsappSubject { get; set; }

            [JsonPropertyName("ForwardMessage.InstagramSubject")]
            public string ForwardMessageInstagramSubject { get; set; }

            [JsonPropertyName("ForwardMessage.TelegramSubject")]
            public string ForwardMessageTelegramSubject { get; set; }

            [JsonPropertyName("ForwardMessage.SMSSubject")]
            public string ForwardMessageSmsSubject { get; set; }

            [JsonPropertyName("ForwardMessage.SkypeSubject")]
            public string ForwardMessageSkypeSubject { get; set; }

            [JsonPropertyName("ForwardMessage.ChatSubject")]
            public string ForwardMessageChatSubject { get; set; }

            [JsonPropertyName("ForwardMessage.MailMaskSubject")]
            public string ForwardMessageMailMaskSubject { get; set; }

            [JsonPropertyName("ForwardMessage.MailMaskBody")]
            public string ForwardMessageMailMaskBody { get; set; }

            [JsonPropertyName("IntervalsPerHour")]
            public int IntervalsPerHour { get; set; }

            [JsonPropertyName("AllowForwardAction")]
            public bool AllowForwardAction { get; set; }

            [JsonPropertyName("ForwardOutsideDomainAvailable")]
            public bool ForwardOutsideDomainAvailable { get; set; }

            [JsonPropertyName("FavoriteMails")]
            public string FavoriteMails { get; set; }

            [JsonPropertyName("AvailableDomainsToForward")]
            public string AvailableDomainsToForward { get; set; }

            [JsonPropertyName("DeleteNotifications")]
            public int DeleteNotifications { get; set; }

            [JsonPropertyName("EnableSurveys")]
            public bool EnableSurveys { get; set; }

            [JsonPropertyName("BusinessDataRegex")]
            public string BusinessDataRegex { get; set; }

            [JsonPropertyName("BusinessDataWrongInputMessage")]
            public string BusinessDataWrongInputMessage { get; set; }

            [JsonPropertyName("BusinessDataFormatMessage")]
            public string BusinessDataFormatMessage { get; set; }

            [JsonPropertyName("ExtendedProfilesFields")]
            public string ExtendedProfilesFields { get; set; }

            [JsonPropertyName("ExtendedCasesFields")]
            public string ExtendedCasesFields { get; set; }

            [JsonPropertyName("ExtendedProfilesBusinessCodeFields")]
            public string ExtendedProfilesBusinessCodeFields { get; set; }

            [JsonPropertyName("Integrations.Integrations")]
            public string IntegrationsIntegrations { get; set; }

            [JsonPropertyName("Integrations.WebAgentIFrameIntegrations")]
            public string IntegrationsWebAgentIFrameIntegrations { get; set; }

            [JsonPropertyName("MinutesPredictedAht")]
            public int MinutesPredictedAht { get; set; }

            [JsonPropertyName("SecondsEwt")]
            public int SecondsEwt { get; set; }

            [JsonPropertyName("AllowToSetASAValueByDefault")]
            public bool AllowToSetASAValueByDefault { get; set; }

            [JsonPropertyName("ASADefaultValue")]
            public int ASADefaultValue { get; set; }

            [JsonPropertyName("MinutesToAbortExporting")]
            public int MinutesToAbortExporting { get; set; }

            [JsonPropertyName("ScheduledReportsToGenerate")]
            public int ScheduledReportsToGenerate { get; set; }

            [JsonPropertyName("RealTime.FunctionsUrl")]
            public string RealTimeFunctionsUrl { get; set; }
        }

        public static string MandatoryTaggingWhenClosingCase()
        {
            ResponseDTO response = BaseResponseDTO();
            response.Result.CasesTagCasesOnClose = 1;
            return JsonSerializer.Serialize(response);
        }
        public static string MandatoryAgentTaggingWhenClosingCase()
        {
            ResponseDTO response = BaseResponseDTO();
            response.Result.CasesTagCasesOnClose = 2;
            return JsonSerializer.Serialize(response);
        }

        private static ResponseDTO BaseResponseDTO()
        {
            return new ResponseDTO
            {
                Success = true,
                Result = new ResultDTO
                {
                    MinimumPasswordStrength = 3,
                    UserPasswordExpireDay = 999,
                    UserPasswordRepeat = true,
                    UserPasswordRepeatAmount = 5,
                    UserPasswordWrongBlock = 5,
                    UserPasswordWrongsCaptha = 0,
                    DaysInactiveUserBlock = 500,
                    UserPasswordRefresh = true,
                    UserPasswordFirstChange = false,
                    UserPasswordValidationRegex = ".+",
                    UserPasswordMessageRegex = "Recuerde ingresar letras minúsculas, mayúsculas, números y símbolos",
                    MinimumAgentPasswordStrength = 4,
                    AgentPasswordExpireDay = 0,
                    AgentPasswordRepeat = true,
                    AgentPasswordRepeatAmount = 0,
                    AgentPasswordWrongsBlock = 5,
                    AgentPasswordWrongsCaptha = 0,
                    DaysInactiveAgentBlock = 500,
                    AgentCanChangePassword = true,
                    AgentPasswordRefresh = false,
                    AgentPasswordFirstChange = true,
                    AgentPasswordValidationRegex = "",
                    AgentPasswordMessageRegex = "Recuerde ingresar letras minúsculas, mayúsculas, números y símbolos",
                    UseSentDate = true,
                    AutoMarkAsReadMessages = false,
                    MaxAssignableMessagesPerUser = 5,
                    SessionTimeOut = 5,
                    WarnAgentForSpellingErrors = true,
                    AllowAgentToBlockUsers = false,
                    AgentMustEnterDiscardReason = false,
                    AllowAgentsToReturnMessagesToQueue = true,
                    AgentMustEnterReturnToQueueReason = false,
                    MaximumNumberOfTimesMessageCanBeReturned = 2,
                    AllowAgentsToSelectQueueOnReturnToQueue = true,
                    AllowAgentsToReturnMessagesWithRelatedMessagesToQueue = false,
                    OutgoingMessagesEnabled = true,
                    ServicesToWarnForMessages = "{\"11\":\"mail de demo\",\"4\":\"Mail coming\",\"26\":\"mensaje twitter RT \"}",
                    AuxReasonForOutgoingMessages = 6,
                    AuthenticationType = 3,
                    LdapUseLdap = false,
                    GoogleAuthEnabled = true,
                    GoogleAuthUseCustom = false,
                    GoogleAuthClientId = "",
                    GoogleAuthClientSecret = "",
                    GoogleAuthAllowCreateLocalAgents = true,
                    GoogleAuthAllowCreateLocalUsers = true,
                    GoogleAuthHostedDomain = "yoizen.com",
                    KeycloakEnabled = false,
                    KeycloakRealmName = "",
                    KeycloakClientSecret = null,
                    KeycloakClientName = "",
                    KeycloakAllowCreateLocalAgents = true,
                    KeycloakAllowCreateLocalUsers = true,
                    KeycloakClientEndpoint = "",
                    WebAgentUrlLoginSettingsUseUrlLogin = true,
                    WebAgentUrlLoginSettingsUserName = "userParam",
                    WebAgentUrlLoginSettingsHashParam = "hashParam",
                    WebAgentUrlLoginSettingsKeyToHash = "keyToHash",
                    WebAgentUrlLoginSettingsPasswordRequired = false,
                    WebAgentUrlLoginSettingsRemoveLoginForm = false,
                    WebAgentUrlLoginSettingsLogoutAction = 0,
                    WebAgentUrlLoginSettingsRemoveLogoutButton = false,
                    StateManagementSettingsAllowChangeState = false,
                    StateManagementSettingsAllowLogoutInvoke = false,
                    CasesCheckLastQueueOfOpenCase = true,
                    CasesMaxElapsedMinutesToCloseCases = 43200,
                    CasesAutoReplyInCloseCaseText = "te cierro desde param de sistema por INACTIVIDAD",
                    CasesAllowToAutoReplyCloseCases = true,
                    CasesTagOnAutoCloseCase = -1,
                    CasesMaxElapsedMinutesToCloseHsmCases = 60,
                    CasesTagOnAutoCloseHsmCases = -1,
                    CasesMaxElapsedMinutesToCloseYFlowCases = 3,
                    CasesInvokeYFlowWhenClosedCases = true,
                    CasesTagCasesOnStart = 0,
                    CasesAlwaysUpdateCase = true,
                    CasesTagCasesOnClose = 1,
                    CasesTagCasesOnDiscard = 0,
                    CasesImportantTag = false,
                    CasesIgnoreLastQueueForSlMovedMessage = true,
                    CasesAllowToAddMessagesToCasesWithMessagesInQueue = true,
                    CasesAllowNotificationWhenClosePendingCase = true,
                    CasesImportantTagOutgoing = true,
                    CasesTagOutgoing = true,
                    InternalChatAgentConnectionUrl = null,
                    WhatsappDefaultInternationCode = 54,
                    WhatsappMaxMinutesToAnswerMessages = 1440,
                    TwitterDmTextCharacterLimit = 10000,
                    TwitterStatusTextCharacterLimit = 280,
                    TwitterCharactersReservedPerMedia = 24,
                    TwitterMaxMediaPerUpload = 1,
                    TwitterPhotoSizeLimit = 3145728,
                    TwitterShortUrlLength = 23,
                    TwitterShortUrlLengthHttps = 23,
                    TwitterAllowMentionInMultipleServices = true,
                    FacebookMessengerMaxMinutesToAnswerMessages = 1440,
                    SmsDefaultInternationCode = 54,
                    InstagramMaxMinutesToAnswerMessages = 1440,
                    ForwardMessageFacebookSubject = "",
                    ForwardMessageFacebookMessengerSubject = "",
                    ForwardMessageTwitterSubject = "",
                    ForwardMessageWhatsappSubject = "Prueba reenvio chat",
                    ForwardMessageInstagramSubject = "",
                    ForwardMessageTelegramSubject = "",
                    ForwardMessageSmsSubject = "",
                    ForwardMessageSkypeSubject = "",
                    ForwardMessageChatSubject = "Prueba reenvio chat",
                    ForwardMessageMailMaskSubject = "",
                    ForwardMessageMailMaskBody = "**Reenvío mediante acciones**\r\n\r\n@@TEXTO@@\r\n@@TEXTO_MENSAJE_RECIBIDO@@\r\n@@REMITENTE_MENSAJE_RECIBIDO@@\r\n@@FECHA_MENSAJE_RECIBIDO@@\r\n@@TIPO_MENSAJE_RECIBIDO@@\r\n@@TEXTO_MENSAJE_SALIENTE@@\r\n@@DESTINATARIO_MENSAJE_SALIENTE@@\r\n@@CASO@@",
                    IntervalsPerHour = 2,
                    AllowForwardAction = true,
                    ForwardOutsideDomainAvailable = true,
                    FavoriteMails = "kmayer@yoizen.com,umarino@yoizen.com",
                    AvailableDomainsToForward = "yoizen.com",
                    DeleteNotifications = 1,
                    EnableSurveys = true,
                    BusinessDataRegex = "^.+$",
                    BusinessDataWrongInputMessage = "El/los número/s de cliente no es un número válido",
                    BusinessDataFormatMessage = "Ingrese letras, números y guiones separados por comas",
                    ExtendedProfilesFields = "[{\"name\":\"eMail\",\"description\":\"Dirección de email\",\"dataType\":\"string\",\"required\":false,\"string\":{\"regex\":\".*\"},\"number\":null,\"float\":null,\"date\":null,\"dropdown\":null},{\"name\":\"nroCelular\",\"description\":\"Número de Línea C\",\"dataType\":\"string\",\"required\":false,\"string\":{\"regex\":\".*\"},\"number\":null,\"float\":null,\"date\":null,\"dropdown\":null}]",
                    ExtendedCasesFields = "[{\"name\":\"nombre\",\"description\":\"nombre usuario\",\"dataType\":\"string\",\"required\":false,\"string\":{\"regex\":\".*\"},\"number\":null,\"float\":null,\"date\":null,\"dropdown\":null},{\"name\":\"telefono\",\"description\":\"telefe usuario\",\"dataType\":\"string\",\"required\":false,\"string\":{\"regex\":\".*\"},\"number\":null,\"float\":null,\"date\":null,\"dropdown\":null}]",
                    ExtendedProfilesBusinessCodeFields = "[{\"name\":\"BD1\",\"description\":\"business data 1 texto\",\"dataType\":\"string\",\"string\":{\"regex\":\".*\"},\"number\":null,\"dropdown\":null},{\"name\":\"BD2\",\"description\":\"business data 2 numerico\",\"dataType\":\"number\",\"string\":null,\"number\":{\"max\":10000,\"min\":0},\"dropdown\":null}]",
                    IntegrationsIntegrations = "{\"AgentMessageDiscarded\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]}],\"AgentMessageReplied\":[{\"Name\":\"Prueba\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[{\"$type\":\"Yoizen.Social.DomainModel.Settings.IntegrationActions.IntegrationActionMessageBoxSettings, Yoizen.Social.DomainModel\",\"Action\":5,\"Message\":\"MENSAJE @@CASO@@\"}]}],\"AgentMessageReturnedToQueue\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]}],\"AgentLoggedIn\":[{\"Name\":\"prueba login santi\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[{\"$type\":\"Yoizen.Social.DomainModel.Settings.IntegrationActions.IntegrationActionHttpRequestSettings, Yoizen.Social.DomainModel\",\"Action\":3,\"Method\":\"POST\",\"Url\":\"https://URL123.com?login=deAgente\",\"Headers\":{\"Content-Type\":\"application/json\"},\"Body\":null,\"HashKey\":\"\"}]}],\"AgentMessageChatFinished\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]},{\"Name\":\"prueba romi\",\"Stop\":false,\"Conditions\":{\"Queues\":[27],\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[{\"$type\":\"Yoizen.Social.DomainModel.Settings.IntegrationActions.IntegrationActionHttpRequestSettings, Yoizen.Social.DomainModel\",\"Action\":3,\"Method\":\"POST\",\"Url\":\"https://qa-test-api-yzn-6d7ca1934c6b.herokuapp.com/api/querystring?codigodeagente=@@AGENTE@@\",\"Headers\":{\"Content-Type\":\"application/json\"},\"Body\":\"\\\"Código de servicio\\\":\\\"@@SERVICIO[CODIGO]@@\\\"\\n\\\"tipo de servicio\\\":\\\"@@SERVICIO[TIPO]@@\\\"\\n\\\"nombre de servicio\\\":\\\"@@SERVICIO[NOMBRE]@@\\\"\\n\\\"caso id\\\":\\\"@@CASO[CODIGO]@@\\\"\",\"HashKey\":\"\"}]}],\"AgentMessageMarkAsRead\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]}],\"AgentMessageMarkAsFinishedRead\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]}],\"AgentNoMoreMessages\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]},{\"Name\":\"prueba romi\",\"Stop\":false,\"Conditions\":{\"Queues\":[27],\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[{\"$type\":\"Yoizen.Social.DomainModel.Settings.IntegrationActions.IntegrationActionHttpRequestSettings, Yoizen.Social.DomainModel\",\"Action\":3,\"Method\":\"POST\",\"Url\":\"https://qa-test-api-yzn-6d7ca1934c6b.herokuapp.com/api/querystring?fechaactual=@@FECHA@@&codigodeagente=@@AGENTE@@\",\"Headers\":{\"Content-Type\":\"application/json\"},\"Body\":\"\\\"nombre de agente\\\"=\\\"@@AGENTE[NOMBRE]@@\\\"\",\"HashKey\":\"\"}]}],\"AgentLoggedOff\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]}],\"AgentUpdatedCase\":[{\"Name\":\"Integración 1\",\"Stop\":false,\"Conditions\":{\"Queues\":null,\"Services\":null,\"Tags\":null,\"SocialServiceTypes\":null},\"Actions\":[]}],\"AgentNewMessage\":[],\"AgentMarkedAsReadFirstAssignedMessageOfCase\":[]}",
                    IntegrationsWebAgentIFrameIntegrations = "",
                    MinutesPredictedAht = 10,
                    SecondsEwt = 30,
                    AllowToSetASAValueByDefault = false,
                    ASADefaultValue = 0,
                    MinutesToAbortExporting = 999,
                    ScheduledReportsToGenerate = 3,
                    RealTimeFunctionsUrl = "https://functions.ysocial.net/"
                }
            };
        }

        public static string BaseResponse()
        {
            return JsonSerializer.Serialize(BaseResponseDTO());
        }

    }
}
