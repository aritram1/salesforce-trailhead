@isTest public class AddPrimaryContactTest {
	@testsetup
    static void makeData(){
        Contact templateContact = new Contact(
        							firstname = 'firstname',
            						lastname = 'AddPrimaryContactTest',
            						email = 'firstname@AddPrimaryContactTest.com'
        						  );
        insert templateContact;
        
        List<Account> Accounts = new List<Account>();
        for(integer i = 0; i<1; i++){
            Accounts.add(new Account(name = 'NY_TESTACCOUNT-' + i, billingState = 'NY'));
            Accounts.add(new Account(name = 'CA_TESTACCOUNT-' + i, billingState = 'CA'));
        }
        insert Accounts;
    }
    
    static testmethod void testAddPrimaryContactFunctionality(){
        Contact templateContact = [SELECT id, firstname, lastname, email from Contact where email = 'firstname@AddPrimaryContactTest.com'];
        Test.startTest();
        	System.enqueueJob(new AddPrimaryContact(templateContact, 'CA'));
        Test.stopTest();
        //System.assertEquals(50, [SELECT count() from Contact where email = 'firstname@AddPrimaryContactTest.com']-1); //50 + 1
        Integer eachCount = [SELECT id, 
                         		(SELECT id from contacts where email='firstname@AddPrimaryContactTest.com') 
                         		from Account 
                         		where billingstate = 'CA'
                        ].contacts.size();
        System.assertEquals(1,eachCount);
            
    }
}
