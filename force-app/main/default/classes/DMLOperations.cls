public class DMLOperations {
    public static void insertDataMethod(){
        List<Account> accList = new List<Account>();
        
        Account accObj = new Account();
        accObj.Name = 'Test３ 29 -12';
        accObj.AccountNumber = '123456';
        accList.add(accObj);
        
        Account accObj1 = new Account();
        accObj1.Name = 'Test４ 29-12';
        accObj1.AccountNumber = '12345679';
        accList.add(accObj1);
        
        List<Account> accountDataList = [SELECT Id, Name FROM Account WHERE Name like '%insert%'];
        delete accountDataList;
        
        /*
        integer count = 0;
        if(accountDataList.size() > 0){
            for(Account acc:AccountDataList){
                Account accObject = new Account();
                if(count  < 5 ){
                    accObject.Id = acc.Id;
                    accObject.Name = acc.Name + Count + '-Update';
                } else{
                    accObject.Name = acc.Name + count + '-inset';
                }
                accountUpsertList.add(accObject);
                count = count + 1;
                
            }
            
            upsert accountUpsertList;
        }
        
        
        
        /*
        Database.SaveResult[] results = Database.insert(accList, false);
        System.debug('---accList---'+results);
        for(Database.SaveResult resp : results){
            if(resp.isSuccess()){
                
            } else{
                for(Database.Error error : resp.getErrors()){
                    System.debug('--Error Status: ' + error.getStatusCode() + '--error Fields:' + error.getFields());
                }
            }
        }*/
    }
}