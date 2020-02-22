// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_batch
/*
Create an Apex class that implements the Database.Batchable interface to update all Lead records in the org with a specific LeadSource. Write unit tests that achieve 100% code coverage for the class.
Create an Apex class called 'LeadProcessor' that uses the Database.Batchable interface.
Use a QueryLocator in the start method to collect all Lead records in the org.
The execute method must update all Lead records in the org with the LeadSource value of 'Dreamforce'.
Create an Apex test class called 'LeadProcessorTest'.
In the test class, insert 200 Lead records, execute the 'LeadProcessor' Batch class and test that all Lead records were updated correctly.
The unit tests must cover all lines of code included in the LeadProcessor class, resulting in 100% code coverage.
Run your test class at least once (via 'Run All' tests the Developer Console) before attempting to verify this challenge.
*/
global class LeadProcessor implements Database.Batchable <sObject>{
    
    global Database.queryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator('SELECT id, leadsource from Lead where leadsource = \'Trailhead\'');
    }
    global void execute(Database.batchableContext bc, List<Lead> scope){
        for (lead l : scope){
            l.leadsource = 'Dreamforce';
        }
        update scope;
    }
    global void finish(Database.batchableContext bc){

    }
    
}
