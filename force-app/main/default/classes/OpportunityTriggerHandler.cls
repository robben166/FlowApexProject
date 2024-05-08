public class OpportunityTriggerHandler {
    public static void updateBigClientField(List<Opportunity> oppList){
        Account acc = new Account();  
        
        for(Opportunity opp : oppList){
             acc = [Select NumberOfEmployees From Account where id = :opp.AccountId];
            if(acc.NumberOfEmployees >= 1000){
                opp.bigClient__c = true;
            } else {
                opp.bigClient__c = false;
            }
        }
    }
}