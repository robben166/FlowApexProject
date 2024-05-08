public class listTutorial 
{
	public static void learnListCollection()
    {
        List<String> strLst = new List<String>();
        
        List<Integer> intList = new List<Integer>();
        
        List<Account> accList = new List<Account>();
        
        List<String> strList = new List<String>{'Yash', 'Sethi', 'Apex'};
            
        strList.add('Yash');
        
        account acc = new account (name = 'Yash');
        
        accList.add(acc);
        
        account acnt = [select id, name from account LIMIT 1];
        accList.add(acnt);
        
        List<Account> accList2 = [select id, name from account];
    }
}