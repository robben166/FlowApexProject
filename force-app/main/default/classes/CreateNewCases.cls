public class CreateNewCases {
	
    public static void CreateCase(String recordId){
        List<Case> caseTobeCreated = new List<Case>();
        List<Contact> contactsWithoutEmail = [SELECT ID, LastName FROM Contact WHERE Email = null AND Id = :recordId];
        System.debug(contactsWithoutEmail.size());
        
        if(!contactsWithoutEmail.isEmpty()){
            for(Contact con : contactsWithoutEmail ){
                Case newCase = new Case();
                newCase.Subject = 'Email is missing';
                newCase.Description = 'The Email Address of ' + con.LastName + 'is missing';
                newCase.Priority = 'High';
                newCase.Status = 'New';
                newCase.Origin = 'Phone';
                newCase.ContactId = con.Id;
                
                caseTobeCreated.add(newCase);
            }
            insert caseTobeCreated;
            System.debug(caseTobeCreated.size() + ' cases created!');
        }
    }
}