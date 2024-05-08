public class ApexExceptionHandling {
    public static void exceptionExample(){
        List<Account> accList = [SELECT Id, Name FROM Account];
        try{
            List<Contact> conList = new List<Contact>();
            for(Account acc:accList){
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.id;
                conList.add(con);
            }
            insert conList;
        } Catch (Exception ex){
            System.debug('---soql error --' +ex.getMessage());
        }
    }
}