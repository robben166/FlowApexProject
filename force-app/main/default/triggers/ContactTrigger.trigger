trigger ContactTrigger on Contact (after insert, after delete) {
  
    
    if(Trigger.isAfter && Trigger.isInsert){
        UpdateContactCount.updateContactCountOnAccount(Trigger.new);
    }
}