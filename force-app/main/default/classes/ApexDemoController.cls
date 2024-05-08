public class ApexDemoController {
    public static void updateContact(){
        List<Contact> conList = new List<Contact>();
        
        conList = [select id, FirstName, LastName from Contact where LastName = 'Test'];
        List<Contact> listToUpdate = new List<Contact>();
        for(contact con : conList){
            con.Title = 'Manager';
            listToUpdate.add(con);
        }
        
        if(listToUpdate != null || listToUpdate.size() > 0){
            update listToUpdate;
        }
    }
}