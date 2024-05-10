@isTest
public class AccountTriggerHandlerTest {
    
    @isTest
    static void testHandleAfterUpdate() {
        // Accountを作成
        Account acc = new Account(Name = 'Test Account', Phone = '5555555555');
        insert acc;
        
        // 連絡先を作成
        Contact con = new Contact(AccountId = acc.Id, LastName = 'Test', HomePhone = '9876543210');
        insert con;
        
        // アカウントのPhoneを更新
        acc.Phone = '1111111111';
        update acc;
        
        // トリガーハンドラーを呼び出す
        Test.startTest();
        Map<Id, Account> newAccountsMap = new Map<Id, Account>{acc.Id => acc};
        Map<Id, Account> oldAccountMap = new Map<Id, Account>{acc.Id => new Account(Phone = '5555555555')}; // 更新前のアカウントのPhoneを設定
        AccountTriggerHandler.handleAfterUpdate(newAccountsMap, oldAccountMap);
        Test.stopTest();
        
        // 連絡先のHomePhoneがアカウントのPhoneに更新されていることを確認
        con = [SELECT HomePhone FROM Contact WHERE Id = :con.Id];
        System.assertEquals('1111111111', con.HomePhone, '連絡先のHomePhoneが更新されていません');
    }
}