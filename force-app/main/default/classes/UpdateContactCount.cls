public class UpdateContactCount {
    public static void updateContactCountOnAccount(List<Contact> newList){
        Set<Id> accIds = new Set<Id>();
        List<Account> updateAccountList = new List<Account>();
        for(Contact con : newList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        if(accIds.size() > 0){
            List<Account> accList = [SELECT Id, Name, (SELECT Id, Name From Contacts) FROM Account WHERE Id IN:accIds];
            for(Account acc: accList){
                acc.Contact_Count__c = acc.Contacts.size();
                updateAccountList.add(acc);
            }
            update updateAccountList;
        }
    }
}