@isTest
public class MixedDMLApex {
	
    static testMethod void DMLExample(){
        Account acc = New Account();
        acc.Name = 'Test Account';
        acc.AccountNumber = '123456';
        insert acc;
        Profile Prof = [SELECT Id, Name FROM Profile WHERE Name = 'Standart User'];
        
        UserRole role = new UserRole();
        role.Name = 'testRole';
        insert role;
      }
    @future
    private static void insertRole(){
        userRole role = new UserRole();
        role.Name = 'testRole';
        insert role;
    }
}