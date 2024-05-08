public class LoopApexClass {
    public static void forLoopMethod(){
        List<Integer> initList = new List<Integer>{1,3,4,5,6,7,8,9,10};
            for(Integer i = 0; i < initList.size(); i++){
                System.debug('--- i ---' + i);
            }
        List<Account> accList = [SELECT id, name from Account];
        
        	 for(Integer i = 0; i < accList.size(); i++){
                System.debug('--- i ---' + i);
        	}
        
    }
    
    public static void enhanceforLoopMethod(){
        List <Account> accList = [Select id, name from Account];
        Set<Id> accIds = new Set<Id>();
        for(Account acc : accList){
            accIds.add(acc.Id);
            //System.debug('---accountData--' + acc);
        }
        
    }
    	
}