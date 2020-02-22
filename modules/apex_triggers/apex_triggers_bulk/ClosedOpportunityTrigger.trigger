//https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_bulk
/*
Create an Apex trigger for Opportunity that adds a task to any opportunity set to 'Closed Won'.
To complete this challenge, you need to add a trigger for Opportunity. The trigger will add a task to any opportunity inserted or updated with the stage of 'Closed Won'. The task's subject must be 'Follow Up Test Task'.
The Apex trigger must be called 'ClosedOpportunityTrigger'
With 'ClosedOpportunityTrigger' active, if an opportunity is inserted or updated with a stage of 'Closed Won', it will have a task created with the subject 'Follow Up Test Task'.
To associate the task with the opportunity, fill the 'WhatId' field with the opportunity ID.
This challenge specifically tests 200 records in one operation.
*/
trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> TaskstoInsert = new List<Task>();
    for(Opportunity o : Trigger.new){
        if(o.stageName.equalsIgnoreCase('Closed Won')){
            Task t = new Task(
                subject = 'Follow Up Test Task',
                whatId = o.id
            );
            TaskstoInsert.add(t);
        }
    }
    if(TaskstoInsert.size() > 0){
        insert TaskstoInsert;
    }
}
