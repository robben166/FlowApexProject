trigger BigClientTrigger on Opportunity (before update, before insert) {
    if((Trigger.isInsert || Trigger.isUpdate)){
        
    }
}