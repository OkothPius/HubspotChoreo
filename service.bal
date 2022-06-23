import ballerinax/salesforce;
import ballerinax/hubspot.crm.contact;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get data() returns json|error {
        // Send a response back to the caller.

        contact:Client contactEndpoint = check new ({auth: {token: "CK6DoIaZMBIHQAEAQAAAARjb1rAMIJXr1BUojLo5MhSjVd0KeI0IXwMAWe-7rDju0Ps5wDowAAAARwAAAAAAAAAAAAAAAACAAAAAAAAAAAAAIAAAAAAA4AEAAAAgAAAAAAAAABACQhSRTTQzf2zqybqXhQNH5TqYaP2zo0oDZXUxUgBaAA"}});
        contact:SimplePublicObject createResponse = check contactEndpoint->create({
            properties: {
                "city": "Cambridge",
                "industry": "Sales",
                "firstname": "Tabitha",
                "email": "tabitha@test.com",
                "lastname": "Makori",
                "phone": "(877) 929-0687",
                "state": "Massachusetts"
            }
        });
        salesforce:Client salesforceEndpoint = check new ({baseUrl: "https://contentlab2-dev-ed.my.salesforce.com", clientConfig: {refreshUrl: "https://login.salesforce.com/services/oauth2/token", refreshToken: "5Aep861g78ZB7.52Bc5slKRxVRgBc9o5goud6O2tbCdGuDdAoQPNzLSJPzzcz2ADrLtb5y9YdhdlSUlFUrNlxpa", clientId: "3MVG9DREgiBqN9WmUCPxLD0NLTyR42IazrIJpzeekfzkQZof_MpurIEwpvdUuZmni8b66z44Q9QAzW_zkWnKf", clientSecret: "46AC8D07313A5298C57D64E41CB0BA4D69A6D195FD051F7C67C4B327084D65FC"}});
        salesforce:OrgMetadata getObjects = check salesforceEndpoint->describeAvailableObjects();
        return getObjects;
    }
}
