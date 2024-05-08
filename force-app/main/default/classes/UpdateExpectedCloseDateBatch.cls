public class UpdateExpectedCloseDateBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start (Database.BatchableContext bc){
        Set<String> stageNames = new Set<String>{'Proposal/Price Quote', 'Negotiation/Review'};
        String query = 'SELECT Id, Name, Stagename, Expected_Close_Date__c FROM Opportunity WHERE StageName : IN:StageNames ';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> OpportunityList){
        for(Opportunity op : OpportunityList){
            op.Expected_Close_Date__c = System.today(). addDays(10);
        }
        
        update OpportunityList;
    }
    public void finish (Database.BatchableContext bc){
        System.debug('Expected close Date batch run successfully');
    }
}