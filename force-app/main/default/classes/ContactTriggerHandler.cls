public class ContactTriggerHandler {
	public static Boolean isTriggerRan = false;
    public static void CreateDuplicateContact(List<Contact> newConList){
        List<Contact> dupConsToInsert = new List<Contact>();
        for(Contact con : newConList){
            Contact con1 = new Contact();
            con1.lastName = 'Dupulicate contact';
            dupConsToInsert.add(con1);
        }
        INSERT dupConsToInsert;
    }
    
    public static void updateAccountFieldsOnUpdate (List<Contact> contactList, Map<Id, Contact> contactMapOld){
        Set<Id> accIds = new Set<Id>();
        for(Contact con : contactList){
            accIds.add(con.AccountId);
            Contact oldValuesOnThatContact = contactMapOld.get(con.Id);
            accIds.add(oldValuesOnThatContact.AccountId);
        }
        List<Account> accsOfRelatedContact = [SELECT id, No_Of_Contacts__c, Sum_of_Amount_Contacts__c, (SELECT id, Amount__c from Contacts) FROM Account WHERE Id IN: accIds];
        for(Account acc : accsOfRelatedContact){
            acc.No_of_Contacts__c = acc.Contacts.size();
            Decimal sumOfAllAmounts = 0;
            for(Contact con : acc.Contacts){
                sumOfAllAmounts = sumOfAllAmounts + con.Amount__c;
            }
        }
        update accsOfRelatedContact;
    }
    
    public static void updateAccountFields(List<Contact> contactList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con :  contactList){
            accIds.add(con.AccountId);
        }
        
        List<Account> accsOfRelatedContact = [SELECT id, No_Of_Contacts__c, Sum_of_Amount_Contacts__c, (SELECT id, Amount__c from Contacts) FROM Account WHERE Id IN: accIds];
        
        for(Account acc : accsOfRelatedContact){
            acc.No_Of_Contacts__c = acc.Contacts.size();
            Decimal sumOfAllAmounts = 0;
            for(Contact  con : acc.Contacts){
                sumOfAllAmounts = sumOfAllAmounts + con.Amount__c;
            }
        }
        update accsOfRelatedContact;
    }
    
    
}