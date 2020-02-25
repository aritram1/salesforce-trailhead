public class AnimalLocatorMock implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest req){
        HttpResponse resp = new HttpResponse();
        resp.setHeader('Content-Type', 'application/json');
        resp.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        resp.setStatusCode(200);
        return resp;
    }
}
