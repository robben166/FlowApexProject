@isTest
public class ContactTriggerHandlerTest {
	
   @isTest
    static void testHandleAfterInsertOrUpdate() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        Contact con1 = new contact(FirstName = 'John', LastName = 'Doe', Email = 'john.doe@gmail.com', AccountId = acc.Id);
        insert con1;
        
        Test.startTest();
        ContactTriggerHandler.handleAfterInsertOrUpdate([SELECT Id, AccountId, Email FROM Contact WHERE AccountId = :acc.Id]);
        Test.stopTest();
        
        acc = [SELECT Id, Latest_Contact_Email__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals('john.doe@gmail.com', acc.Latest_Contact_Email__c);
    }
}