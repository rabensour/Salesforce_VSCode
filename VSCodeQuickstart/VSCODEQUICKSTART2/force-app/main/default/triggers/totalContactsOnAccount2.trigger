trigger totalContactsOnAccount2 on Contact (after insert, after update, after delete, after undelete) {
    
    if (trigger.isAfter)
    {
        if (trigger.isInsert || trigger.isUpdate || trigger.isDelete || trigger.isUndelete)
        {
            totalContactsHandler.countContacts(Trigger.new, Trigger.old);
        }
    }
}