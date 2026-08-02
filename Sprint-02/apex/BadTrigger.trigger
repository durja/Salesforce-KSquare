trigger BadBookTrigger on Book_Issue__c (before insert) {

    for(Book_Issue__c issue : Trigger.new){

        Book__c book = [
            SELECT Id, Status__c
            FROM Book__c
            WHERE Id = :issue.Book__c
        ];

        if(book.Status__c == 'Out of Stock'){
            issue.addError('Book is Out of Stock');
        }
    }

}
