@isTest public class DailyLeadProcessorTest {
	@testsetup
    static void makeData(){
        List<Lead> insertLeadRecords = new List<Lead>();
        for(Integer i = 0; i<200; i++){
            insertLeadRecords.add(new Lead(
            	lastName = 'LASTNAME ' + i,
                company = 'TEST COMPANY',
                status = 'Open',
                leadsource = ''
            ));
        }
        insert insertLeadRecords;
    }
    static testmethod void testDailyLeadProcessor(){
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        Test.startTest();
        	System.schedule('Scheduled from Trailhead', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        System.assertEquals(200,[SELECT id from Lead where leadsource='Dreamforce'].size());
    }
}
