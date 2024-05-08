@isTest
public class OpportunityFlowTest {
    
    @isTest
    static void testExecute() {
        // テスト用のアカウントを作成
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // テスト用の商談を作成
        Opportunity opp1 = new Opportunity(Name = 'Opportunity 1', StageName = 'Closed Won', Amount = 1000, AccountId = acc.Id, CloseDate = Date.today());
        Opportunity opp2 = new Opportunity(Name = 'Opportunity 2', StageName = 'Closed Won', Amount = 2000, AccountId = acc.Id, CloseDate = Date.today());
        insert new List<Opportunity>{opp1, opp2};
        
        // テスト: executeメソッドの呼び出し
        Test.startTest();
        OpportunityFlow.execute(acc.Id);
        Test.stopTest();
        
        // アカウントが正しく更新されていることを確認
        acc = [SELECT Id, Amount__c FROM Account WHERE Id = :acc.Id];
        
        // 期待値を計算
        Decimal expectedAmount = opp1.Amount + opp2.Amount; // Closed Wonの商談の金額の合計
        
        System.assertEquals(expectedAmount, acc.Amount__c, 'Account Amount should be the sum of all Closed Won Opportunities Amounts');
    }
}