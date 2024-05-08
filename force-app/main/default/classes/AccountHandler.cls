public class AccountHandler {
    public static void insertContact(List<Account> newList){
        List<Contact> conListInsert = new List<Contact>();
        for(Account acc : newList){
            Contact conObj = new Contact();
            conObj.LastName = acc.Name;
            conObj.Title = 'Developer';
            conListInsert.add(conObj);
        }
        if(conListInsert.size() > 0){
            insert conListInsert;
        }
    }
}