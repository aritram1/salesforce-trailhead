@isTest class ParkLocatorTest {
    @isTest static void testParkSearch(){
        Test.startTest();
            Test.setMock(WebServiceMock.class, new ParkServiceMock());
            String countryName = 'India';
            List<String> parks = ParkLocator.country(countryName);
            System.debug('parks-->' + parks); //Anamudi Shola National Park, Anshi National Park, Bandipur National Park
            System.assertEquals(3, parks.size());            
        Test.stopTest();
    }
}
