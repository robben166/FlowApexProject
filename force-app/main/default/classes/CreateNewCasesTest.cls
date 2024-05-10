@isTest
public class CreateNewCasesTest {
	
    @isTest
    static void testCreateNewCases(){
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
 
        Contact testContact1 = new Contact(LastName = 'Test Contact1 ', AccountId = testAccount.Id);
        Contact testContact2 = new Contact(LastName = 'Test Contact 2', AccountId = testAccount.Id);
        insert new List<Contact>{testContact1, testContact2};
        
        Test.startTest();
        CreateNewCases.CreateCase(testContact1.Id);
        Test.stopTest();
        
        List<Case> createdCases = [SELECT Id FROM Case WHERE ContactId = :testContact1.Id];
        System.assertEquals(1, createdCases.size(), 'Expected 1 case to be created for Test Contact 1');
    }
}