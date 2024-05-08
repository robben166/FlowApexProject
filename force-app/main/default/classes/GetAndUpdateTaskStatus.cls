public class GetAndUpdateTaskStatus {
	
    public static void UpdateAccountRelatedTasks(String recordId) {
        List<Account> acc = [SELECT Id FROM Account WHERE Id = :recordId];
        List<Task> addToUpdateTaskCollection = new List<Task>(); // セミコロンを追加
        
        if (!acc.isEmpty()) {
            List<Task> relatedTasks = [SELECT Id, Status FROM Task WHERE WhatId = :recordId]; // Taskの関連条件修正
            if (relatedTasks != null && !relatedTasks.isEmpty()) {
                for (Task t : relatedTasks) {
                    t.Status = 'Completed';
                    addToUpdateTaskCollection.add(t);
                }
                
                System.debug('Tasks to be updated: ' + addToUpdateTaskCollection); // 追加：タスクの更新内容をログに出力
                
                update addToUpdateTaskCollection; // メソッド名の修正
            }
        }
    }
}