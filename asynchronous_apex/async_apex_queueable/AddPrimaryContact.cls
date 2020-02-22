// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_queueable
/*
Create an Queueable Apex class that inserts Contacts for Accounts.
Create a Queueable Apex class that inserts the same Contact for each Account for a specific state. Write unit tests 
that achieve 100% code coverage for the class.
Create an Apex class called 'AddPrimaryContact' that implements the Queueable interface.
Create a constructor for the class that accepts as its first argument a Contact sObject and a second argument 
as a string for the State abbreviation.
The execute method must query for a maximum of 200 Accounts with the BillingState specified by 
the State abbreviation passed into the constructor and insert the Contact sObject record 
associated to each Account. Look at the sObject clone() method.
Create an Apex test class called 'AddPrimaryContactTest'.
In the test class, insert 50 Account records for BillingState "NY" and 50 Account records for BillingState "CA". 
Create an instance of the AddPrimaryContact class, enqueue the job and assert that a Contact record was inserted for 
each of the 50 Accounts with the BillingState of "CA".
The unit tests must cover all lines of code included in the AddPrimaryContact class, resulting in 100% code coverage.
Run your test 
*/
public class AddPrimaryContact implements Queueable {
    private Contact templateContact;
    private String state;
    public AddPrimaryContact(Contact templateContact, String state){
        this.templateContact = templateContact;
        this.state = state;
    }
    public void execute(System.QueueableContext sq){
        List<Contact> contactsToUpdate = new List<Contact>();
        for (Account a : [SELECT id from Account where billingState = :state limit 200]){
           	Contact newContact = templateContact.clone(); //Clone the contact
           	newContact.accountId = a.id;				  //Reparent to current account
        	contactsToUpdate.add(newContact);			  //Add to the list to insert
        }
        
        if(contactsToUpdate.size() > 0)
            insert contactsToUpdate;					  //insert the contacts
    }
}
