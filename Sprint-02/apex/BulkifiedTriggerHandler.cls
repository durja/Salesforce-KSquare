public class BookIssueTriggerHandler {

    public static void validateBooks(List<Book_Issue__c> newIssues){

        Set<Id> bookIds = new Set<Id>();

        for(Book_Issue__c issue : newIssues){
            if(issue.Book__c != null){
                bookIds.add(issue.Book__c);
            }
        }

        Map<Id, Book__c> books = new Map<Id, Book__c>(
            [
                SELECT Id,
                       Name,
                       Status__c
                FROM Book__c
                WHERE Id IN :bookIds
            ]
        );

        for(Book_Issue__c issue : newIssues){

            Book__c book = books.get(issue.Book__c);

            if(book != null &&
               book.Status__c == 'Out of Stock'){

                issue.addError('Book "' + book.Name + '" is currently out of stock.');

            }

        }

    }

}
