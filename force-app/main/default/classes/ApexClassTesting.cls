@isTest
public class ApexClassTesting {
    @TestSetup
    private static void allTestRecords(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
    }
    @isTest
    private static void createAccountTest(){
        String accId = [SELECT id FROM Account WHERE Name = 'Test'].Id;
        
        Test.startTest();
        
		TestClassTestingApex.getAccountData('test');
        
        Test.stopTest();
    }
}