public class OpportunityTriggerHandler {
    public static void onAfterUpdate(List<Opportunity> newList, Map<Id, Opportunity> oldMap) {
        List<Opportunity> updatedOpportunities = new List<Opportunity>();

        for (Opportunity opp : newList) {
            // フィールドが変更された場合に処理を実行
            if (opp.Opportunity_Notes__c != null && opp.Opportunity_Notes__c != oldMap.get(opp.Id).Opportunity_Notes__c) {
                
                updatedOpportunities.add(opp);
            }
        }
    }

}