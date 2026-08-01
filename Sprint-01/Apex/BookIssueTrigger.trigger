trigger BookIssueTrigger on Book_Issue__c (before insert, after update) {

    if (Trigger.isBefore && Trigger.isInsert) {
        BookIssueTriggerHandler.preventDuplicateIssue(Trigger.new);
    }

    if (Trigger.isAfter && Trigger.isUpdate) {
        BookIssueTriggerHandler.updateBookStatus(Trigger.new);
    }

}
