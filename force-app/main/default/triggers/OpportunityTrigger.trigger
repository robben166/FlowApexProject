trigger OpportunityTrigger on Opportunity (before update, before insert, after insert) {
    if(Trigger.isBefore && Trigger.isUpdate){
        Map<Id, Opportunity> oldMapData = Trigger.oldMap;
        Map<Id, Opportunity> newMapData = Trigger.newMap;
        
        for(Opportunity newOpp : Trigger.new){
            //for(Opportunity newOpp : Trigger.new){
                if(oldMapData.get(newOpp.Id).StageName != newMapData.get(newOpp.Id).StageName){
                    System.debug('---Opporunity stage has been changed!');
                }
            //}
        }
    }
    
    
}