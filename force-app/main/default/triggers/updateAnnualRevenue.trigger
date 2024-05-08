trigger updateAnnualRevenue on Account (before Update) {
	List<Opportunity> oppList = [SELECT amount FROM Opportunity WHERE StageName = 'Close Won' and AccountId =:Trigger.new[0].id];
    decimal  i = 0;
    
    for(Account acc : Trigger.new){
        for(Opportunity o : oppList){
            
            i = i + o.Amount;
        }
        
        acc.AnnualRevenue = i;
    }
}