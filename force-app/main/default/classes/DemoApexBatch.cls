public class DemoApexBatch implements Database.Batchable<sObject>{
    public  Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT id, Name from Account';
        return Database.getQueryLocator([SELECT Id, Name FROM Account]);
    }
    public void execute (Database.BatchableContext bc, List<Account> listOfAccount){
        System.debug('--- List of data ---' + listOfAccount);
    } 
    public void finish(Database.BatchableContext bc){
        System.debug('--- finish batch---' );
    }
}