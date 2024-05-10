public class CountActiveAccounts {
	
    public static void CountAccounts(){
        List<Account> activeAcc = [SELECT Id FROM Account WHERE isActive__c = true];
        if(!activeAcc.isEmpty()){
            System.debug(activeAcc.size());
        }
    }
}