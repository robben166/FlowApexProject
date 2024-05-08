public class APEXSOQL {
    public static void fetchmap(){
        Map<Id, Account> accountMap = new Map<Id, Account>(
        [select id, name from account]
        );
    }
}