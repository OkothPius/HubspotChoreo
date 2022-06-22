import ballerinax/salesforce;
import ballerinax/hubspot.crm.contact;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get data() returns json|error {
        // Send a response back to the caller.

        contact:Client contactEndpoint = check new ({auth: {refreshUrl: "https://api.hubapi.com/oauth/v1/token", refreshToken: "eu1-af5b-45a9-4ee2-8258-ea7cc40c7c2e", clientId: "870c8aa3-a0d7-42ec-bc97-b9b7bbaf106c", clientSecret: "fe12cd9a-b33f-4e05-9529-59a1addbedad"}});
        salesforce:Client salesforceEndpoint = check new ({baseUrl: "https://contentlab2-dev-ed.my.salesforce.com", clientConfig: {refreshUrl: "https://login.salesforce.com/services/oauth2/token", refreshToken: "5Aep861g78ZB7.52Bc5slKRxVRgBc9o5goud6O2tbCdGuDdAoQPNzLSJPzzcz2ADrLtb5y9YdhdlSUlFUrNlxpa", clientId: "3MVG9DREgiBqN9WmUCPxLD0NLTyR42IazrIJpzeekfzkQZof_MpurIEwpvdUuZmni8b66z44Q9QAzW_zkWnKf", clientSecret: "46AC8D07313A5298C57D64E41CB0BA4D69A6D195FD051F7C67C4B327084D65FC"}});
        return "";
    }
}
