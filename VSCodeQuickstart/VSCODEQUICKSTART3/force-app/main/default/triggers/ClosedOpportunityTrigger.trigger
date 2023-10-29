trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> followUpTasks = new List<Task>();
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            Task followUpTask = new Task (
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            followUpTasks.add(followUpTask);
        }
    }
    if (!followUpTasks.isEmpty()) {
        Database.insert(followUpTasks, false); // Bulk insert with allOrNone=false
    }
}