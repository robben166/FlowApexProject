public class AccountTriggerHandler {
	
    public static void handleAfterUpdate(Map<Id, Account> newAccountsMap, Map<Id, Account> oldAccountMap) {
        Set<Id> accountIdsToUpdate = new Set<Id>();
       
        for (Account newAcc : newAccountsMap.values()) {
            Account oldAcc = oldAccountMap.get(newAcc.Id);
            if (oldAcc != null && newAcc.Phone != oldAcc.Phone) { 
                accountIdsToUpdate.add(newAcc.Id);
            }
        }
        
        List<Contact> contactsToStore = [SELECT Id, AccountId, HomePhone FROM Contact WHERE AccountId IN :accountIdsToUpdate];
        List<Contact> contactsToUpdate = new List<Contact>();
        
        for (Contact con : contactsToStore) {
            con.HomePhone = newAccountsMap.get(con.AccountId).Phone; // 更新後のアカウントのPhoneを設定
            contactsToUpdate.add(con);
        }
        
        update contactsToUpdate;
    }
}