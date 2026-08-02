System.debug('========== LIST ==========');

List<String> cities = new List<String>{
    'Hyderabad',
    'Chennai',
    'Bengaluru',
    'Mumbai',
    'Delhi'
};

for(String city : cities){
    System.debug(city.toUpperCase());
}


System.debug('========== SET ==========');

Set<Id> bookIds = new Set<Id>();

for(Book__c book : [
    SELECT Id
    FROM Book__c
]){
    bookIds.add(book.Id);
}

System.debug('Total Unique Books : ' + bookIds.size());


System.debug('========== MAP ==========');

Map<Id, Book__c> bookMap = new Map<Id, Book__c>(
    [SELECT Id, Name, Author__c, Status__c
     FROM Book__c]
);

Id firstBookId = bookMap.keySet().iterator().next();

Book__c selectedBook = bookMap.get(firstBookId);

System.debug('Book Name : ' + selectedBook.Name);
System.debug('Author : ' + selectedBook.Author__c);
System.debug('Status : ' + selectedBook.Status__c);
