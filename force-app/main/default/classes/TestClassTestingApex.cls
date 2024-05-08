public class TestClassTestingApex {
    @testVisible
    private static void getAccountData(String accId){
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Id =:accId];
        if(accList.size() >0){
            System.debug('Tesing completed');
            Contact con = new Contact();
            con.LastName = accList[0].Name;
            insert con;
        }
    }
}