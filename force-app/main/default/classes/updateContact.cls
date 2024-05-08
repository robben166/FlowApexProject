public class updateContact {
    public static void updateContact(String name){
        List<Contact> conList = [select id, FirstName, LastName From Contact Where  LastName = :name];
        List<Contact> listToUpdate = new List<Contact>();
        for(Contact con : conList){
            con.Title = 'Manage';
            listToUpdate.add(con);
        }
    }
}