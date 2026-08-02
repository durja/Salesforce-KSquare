trigger BookIssueTrigger on Book_Issue__c (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        BookIssueTriggerHandler.validateBooks(Trigger.new);
    }

}
