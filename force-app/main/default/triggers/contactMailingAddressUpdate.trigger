trigger contactMailingAddressUpdate on Account (before insert) {
    for(Account a : Trigger.new){
        List<Contact> contactList = [select id, MailingStreet, MailingCity, MailingState, MailingCountry, MailingPostalCode From Contact Where AccountId =: a.Id];
    }
}