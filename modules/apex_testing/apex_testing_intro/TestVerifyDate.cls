//class : https://github.com/developerforce/trailhead-code-samples/blob/master/VerifyDate.cls

@isTest public class TestVerifyDate {
	
    static testmethod void testVerifyDate(){
    	Date currentDate = Date.newInstance(2020,1,10);
        Date exact30days = Date.newInstance(2020,1,31);
        Date within30days1 = currentDate.addDays(-5);
        Date within30days2 = currentDate.addDays(5);
        Date outside30days1 = currentDate.addDays(-35);
        Date outside30days2 = currentDate.addDays(35);
        
        
        Test.startTest();
        	System.assertEquals(exact30days,VerifyDate.CheckDates(currentDate, within30days1)); 
        	System.assertEquals(within30days2,VerifyDate.CheckDates(currentDate, within30days2)); 
        	
        	System.assertEquals(exact30days,VerifyDate.CheckDates(currentDate, outside30days1));
        	System.assertEquals(exact30days,VerifyDate.CheckDates(currentDate, outside30days2));
        
        Test.stopTest();
        
                
    }
}
