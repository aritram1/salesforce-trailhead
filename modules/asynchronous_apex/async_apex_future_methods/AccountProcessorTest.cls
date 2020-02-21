//trailhead : https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_future_methods

@isTest 
public class AccountProcessorTest{
    @isTest
    public static void testcountContacts(){
        Test.startTest();
            Account testAccount1 = new Account(name= 'test1');
            Account testAccount2 = new Account(name= 'test2');
            List<Account> tempAccounts= new List<Account>();
            tempAccounts.add(testAccount1);
            tempAccounts.add(testAccount2);
            insert tempAccounts;
            
            Contact testContact1 = new Contact(lastname = 'testlastname1', accountId = tempAccounts[0].id);
            Contact testContact2 = new Contact(lastname = 'testlastname2', accountId = tempAccounts[1].id);
            List<Contact> tempContacts= new List<Contact>();
            tempContacts.add(testContact1);
            tempContacts.add(testContact2);
            insert tempContacts;
            
            List<Id> accountIdList = new List<Id>();
            accountIdList.add(testAccount1.id);
            accountIdList.add(testAccount2.id);
            AccountProcessor.countContacts(accountIdList);      
        Test.stopTest();
    }
    

}
