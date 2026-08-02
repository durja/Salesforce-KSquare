Books__c book = [
    SELECT Id
    FROM Books__c
    LIMIT 1
];

BooksFuture.updateBookStatus(book.Id);
