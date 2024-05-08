public class DemoQueueable implements Queueable {
	public List<Account> accList;
    public DemoQueueable(List<Account> accList){
        this.accList = accList;
    }
    
    public void execute(QueueableContext qc){
        
        //List<Account> accList = [SELECT Id, Name FROM Account];
        if(accList.size()>0){
        for(Account acc: accList){
            acc.Name = acc.Name +' -SFDC Madhukar';
            
         	}
            	update accList;
        }
    }
}