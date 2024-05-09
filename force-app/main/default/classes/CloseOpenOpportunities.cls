public class CloseOpenOpportunities {
    
    public static void CloseOpp(String recordId) {
        List<Opportunity> collectionStage = new List<Opportunity>(); 
        List<Opportunity> openOpps = [SELECT Id, StageName FROM Opportunity WHERE AccountId = :recordId AND StageName != 'Closed Won']; 
        if (!openOpps.isEmpty() && openOpps.size() > 0) { 
            System.debug('openOpps '  + openOpps.size());
            
            for (Opportunity o : openOpps) {
                o.StageName = 'Closed Lost'; 
                collectionStage.add(o);
            }
            update collectionStage;
        }
    }
}