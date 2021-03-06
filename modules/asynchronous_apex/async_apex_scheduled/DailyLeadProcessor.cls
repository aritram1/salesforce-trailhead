//https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_scheduled
/*
Create an Apex class that uses Scheduled Apex to update Lead records.
Create an Apex class that implements the Schedulable interface to update Lead records with a specific LeadSource. Write unit tests that achieve 100% code coverage for the class. This is very similar to what you did for Batch Apex.
Create an Apex class called 'DailyLeadProcessor' that uses the Schedulable interface.
The execute method must find the first 200 Leads with a blank LeadSource field and update them with the LeadSource value of 
'Dreamforce'.
Create an Apex test class called 'DailyLeadProcessorTest'.
In the test class, insert 200 Lead records, schedule the DailyLeadProcessor class to run and test that all Lead records were updated correctly.
The unit tests must cover all lines of code included in the DailyLeadProcessor class, resulting in 100% code coverage.
Run your test class at least once (via 'Run All' tests the Developer Console) before attempting to verify this challenge.
*/
global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext sc){
        List<Lead> leadRecords = [SELECT id, leadsource from Lead where leadsource = '' limit 200];
        for (Lead l : leadRecords){
            l.leadsource = 'Dreamforce';
        }
        update leadRecords;
    }
}
