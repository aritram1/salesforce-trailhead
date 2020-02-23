//https://trailhead.salesforce.com/content/learn/modules/apex_testing/apex_testing_triggers

//trigger : https://github.com/developerforce/trailhead-code-samples/blob/master/RestrictContactByName.cls

/*
Create a unit test for a simple Apex trigger.
Install a simple Apex trigger, write unit tests that achieves 100% code coverage for the trigger, and run your Apex tests.
The Apex trigger to test is called 'RestrictContactByName', and the code is available here. Copy and paste this trigger into your Developer Edition via the Developer Console.
'RestrictContactByName' is a trigger which blocks inserts and updates to any contact with a last name of 'INVALIDNAME'.
The unit tests must be in a separate Apex class called 'TestRestrictContactByName'.
The unit tests must cover scenarios for all lines of code included in the Apex trigger, resulting in 100% code coverage.
Run your test class at least once (via 'Run All' tests the Developer Console) before attempting to verify this challenge.
*/
@isTest public class TestRestrictContactByName {
    @isTest static void testContactInsert(){
        Contact c = new Contact(lastName='INVALIDNAME');
        try{
            insert c;
        }catch(System.DmlException e){
            //handle it
        }
    }
    @isTest static void testContactUpdate(){
        Contact c = new Contact(lastName='VALID');
        insert c;
        c.lastName = 'INVALIDNAME';
        try{
            update c;
        }catch(System.DmlException e){
            //handle it
        }
        
    }
}
