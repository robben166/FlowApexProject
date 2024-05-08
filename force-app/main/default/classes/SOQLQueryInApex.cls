public class SOQLQueryInApex {
    public static void variableUseMethod(String Name){
        List<Account> accObj = [SELECT Id, Name, CreatedDate, Type FROM Account Where Name != :name];
        
        system.debug('---Accountdata -- ' + accObj);
    }
    
    public static void dynamicaQuery(String profile){
        String query = '';
        query = 'Select Id';
        if(profile == 'System'){
            query += ',Name, Rating, Type FROM Account';
        }else {
            query += ',Name from Account';
        }
        List<Account> accountList = Database.query(query);
        System.debug('-- dynamic Data-- ' + accountList);
    }
    
    public static void prarentToChildSOQL(){
        List<Account> accountWithOpportunity = [SELECT Id, Name, Type, (SELECT Id, Name, Amount, StageName From Opportunities) FROM Account];
        //System.debug(accountWithOpportunity);
        //for(Account acc:accountWithOpportunity){
            //System.debug('---oppo Data ---' +acc.Opportunities);
            //
        List<Opportunity> oppwithAccount = [SELECT Id, Name, Amount, Account.Name, Account.Type FROM Opportunity];
        	System.debug('---oppo with Accput--' + oppWithAccount);
        }
}