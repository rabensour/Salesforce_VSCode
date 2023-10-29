@isTest
public class AnimalLocatorMock implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest request) {
        // Create a mock HTTP response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
       
        response.setBody('{"animal":{"id": 1, "name": "Lion"}}');
        response.setStatusCode(200);
        return response;
    }
}