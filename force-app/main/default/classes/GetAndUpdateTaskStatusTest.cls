@isTest
public class GetAndUpdateTaskStatusTest {
	@isTest
    static void testUpdateAccountRelatedTasks(){
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        Task task1 = new Task(Subject = 'Test Task1' , WhatId = acc.Id);
        Task task2 = new Task(Subject = 'Task Task2', whatId = acc.Id);
        insert new List<Task>{task1, task2};
        
        Test.startTest();
        GetAndUpdateTaskStatus.UpdateAccountRelatedTasks(acc.Id);
        Test.stopTest();
        
        List<Task> updatedTasks = [SELECT Id, Status FROM Task WHERE WhatId = :acc.Id];
        System.assertEquals('Completed', updatedTasks[0].Status);
        System.assertEquals('Completed', UpdatedTasks[1].Status);
    }
}