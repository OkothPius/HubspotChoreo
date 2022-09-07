
import ballerinax/hubspot.crm.contact;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get data() returns json|error {
        // Send a response back to the caller.

        contact:Client contactEndpoint = check new ({auth: {token: "CPC6_piZMBIHQAEAQAAAARjb1rAMIJXr1BUojLo5MhTZCTJIg4OevHCM2o_G94yi-I9wzjowAAAARwAAAAAAAAAAAAAAAACAAAAAAAAAAAAAIAAAAAAA4AEAAAAgAAAAAAAAABACQhRiwZ68T9o6xVoXpMuhELniEFqUhUoDZXUxUgBaAA"}});
        contact:SimplePublicObject createResponse = check 
        contactEndpoint->create({
            properties: {
                "city": "Sacramento",
                "industry": "Tech",
                "firstname": "John",
                "lastname": "Doe",
                "email": "jdoe@test.com",
                "phone": "(877) 929-0687",
                "state": "California"
            }
        });

        return createResponse.toJson();
    }
}
