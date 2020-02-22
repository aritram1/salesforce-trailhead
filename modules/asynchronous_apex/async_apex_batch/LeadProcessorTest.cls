@isTest 
public with sharing class LeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> toInsertLeads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){	//200 count is maximum
            Lead l = new Lead(
                lastName = 'LASTNAME ' + i,
                company = 'TEST COMPANY',
                status = 'Open',
                leadsource = 'Trailhead'    //These leads are to be tested with
            );
            toInsertLeads.add(l);
        }
        insert toInsertLeads;
    }
    
    static testmethod void testLeadProcessing(){
        Test.startTest();
            Id batchId = Database.executeBatch(new LeadProcessor(), 200);
        Test.stopTest();
        System.assertEquals(0, [SELECT count() from Lead where leadsource='Trailhead']);
        System.assertEquals(200, [SELECT count() from Lead where leadsource='Dreamforce']);
    }
}
