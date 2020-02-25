//https://trailhead.salesforce.com/en/content/learn/modules/apex_integration_services/apex_integration_rest_callouts
/*
Create an Apex class that calls a REST endpoint and write a test class.
To pass this challenge, create an Apex class that calls a REST endpoint to return the name of an animal, write unit tests that achieve 100% code coverage for the class using a mock response, and run your Apex tests.
The Apex class must be called 'AnimalLocator', have a 'getAnimalNameById' method that accepts an Integer and returns a String.
The 'getAnimalNameById' method must call https://th-apex-http-callout.herokuapp.com/animals/:id, using the ID passed into the method.
The method returns the value of the 'name' property (i.e., the animal name).
Create a test class named AnimalLocatorTest that uses a mock class called AnimalLocatorMock to mock the callout response.
The unit tests must cover all lines of code included in the AnimalLocator class, resulting in 100% code coverage.
Run your test class at least once (via 'Run All' tests the Developer Console) before attempting to verify this challenge.
*/
public class AnimalLocator {
    public static string getAnimalNameById(Integer id){
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        HttpResponse response = new http().send(request);
        Map<String, Object> result, animal;
        String name;
        if(response.getStatusCode() == 200){
            result = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            animal = (Map<String, Object>)result.get('animal');	//expected : {eats=chicken food, id=1, name=chicken, says=cluck cluck}
            name = (String)animal.get('name');
        }
        return name;
    }
}

