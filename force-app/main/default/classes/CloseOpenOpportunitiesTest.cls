@isTest
public class CloseOpenOpportunitiesTest {
    
    @isTest
    static void testCloseOpp() {
        // テストデータの準備
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        Opportunity opp1 = new Opportunity(Name = 'Test Opp 1', StageName = 'Prospecting', CloseDate = Date.today(), AccountId = testAccount.Id);
        Opportunity opp2 = new Opportunity(Name = 'Test Opp 2', StageName = 'Qualification', CloseDate = Date.today(), AccountId = testAccount.Id);
        insert new List<Opportunity>{opp1, opp2};
        
        Test.startTest();
        // メソッドの実行
        CloseOpenOpportunities.CloseOpp(testAccount.Id);
        Test.stopTest();
        
        // 結果の検証
        List<Opportunity> updatedOpps = [SELECT StageName FROM Opportunity WHERE AccountId = :testAccount.Id];
        for (Opportunity opp : updatedOpps) {
            System.assertEquals('Closed Lost', opp.StageName);
        }
    }
}