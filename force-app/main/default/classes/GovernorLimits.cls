public class GovernorLimits {
    public static void limitsMethod(){
        for(Integer i = 1; i <= 200; i++){
            //List<Account> accList = [SELECT Id, Name  FROM Account];
            
            Account accObj = new Account();
            accObj.Name = 'Test-' +i;
            insert accObj;
        }
    }
}