public class ScheduleApexClass implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Account> accList = [SELECT Id, Name from Account];
        for(Account acc:accList){
            acc.Name.Replace('test','');
        }
        update accList;
    }
}