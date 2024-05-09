public class GetAndUpdateTaskStatus {
	
    public static void UpdateAccountRelatedTasks(String recordId) {
        List<Account> acc = [SELECT Id FROM Account WHERE Id = :recordId];
        List<Task> addToUpdateTaskCollection = new List<Task>(); 
        
        if (!acc.isEmpty()) {
            List<Task> relatedTasks = [SELECT Id, Status FROM Task WHERE WhatId = :recordId]; 
            if (relatedTasks != null && !relatedTasks.isEmpty()) {
                for (Task t : relatedTasks) {
                    t.Status = 'Completed';
                    addToUpdateTaskCollection.add(t);
                }
                
                System.debug('Tasks to be updated: ' + addToUpdateTaskCollection); 
                
                update addToUpdateTaskCollection; 
            }
        }
    }
}