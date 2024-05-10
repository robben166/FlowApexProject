public class ContactTriggerHandler {
	
    public static void handleAfterInsertOrUpdate(List<Contact> newContacts){
        Set<Id> accountIdsToUpdate = new Set<Id>();
        
        for(Contact con : newContacts){
            accountIdsToUpdate.add(con.AccountId);
        }
        
        List<Account> accountsToUpdate = [SELECT Id, Latest_Contact_Email__c FROM Account WHERE Id IN :accountIdsToUpdate];
        for(Account acc : accountsToUpdate){
            for(Contact con : newContacts){
                if(acc.Id == con.AccountId){
                    acc.Latest_Contact_Email__c = con.Email;
                }
            }
        }
        
        update accountsToUpdate;
    }
}