@isTest public class AnimalLocatorTest {
    @isTest static void testcallout(){
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); // This causes a fake response to be sent from the class that implements HttpCalloutMock.
            //System.assertEquals('application/json', response.getHeader('Content-Type'));
            System.assertEquals('chicken', AnimalLocator.getAnimalNameById(1));
            //System.assertEquals(200, response.getStatusCode());
        Test.stopTest();
    }
}
