public class OpportunityFlow {
    
    public static List<Opportunity> UpdatedOpportunityCollection = new List<Opportunity>();
    public static Decimal TotalOppAmount = 0.0;
    
    public static void execute(String recordId){
       
        List<Opportunity> opportunities = [SELECT Id, StageName, Amount FROM Opportunity WHERE AccountId = :recordId];
        if (!opportunities.isEmpty()) {
            for(Opportunity opp : opportunities){
                opp.StageName = 'Closed Won';
                TotalOppAmount += opp.Amount;
                UpdatedOpportunityCollection.add(opp);
            }
            update UpdatedOpportunityCollection;
        } else {
            System.debug('Opportunities not found for AccountId: ' + recordId);
        }
        
        Account acc = [SELECT Id from Account WHERE Id = :recordId];
        if(acc != null){
            acc.Amount__c = TotalOppAmount;
            update acc;
        } else {
            System.debug('Account does not exist for Id: ' + recordId);
        }
    }
}