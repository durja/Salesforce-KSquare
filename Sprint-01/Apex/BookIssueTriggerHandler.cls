public class BookIssueTriggerHandler {

    // Prevent duplicate issue records
    public static void preventDuplicateIssue(List<Book_Issue__c> newIssues) {

        Set<Id> bookIds = new Set<Id>();
        Set<Id> memberIds = new Set<Id>();

        for(Book_Issue__c issue : newIssues){
            if(issue.Book__c != null && issue.Member__c != null){
                bookIds.add(issue.Book__c);
                memberIds.add(issue.Member__c);
            }
        }

        List<Book_Issue__c> existingIssues = [
            SELECT Id, Book__c, Member__c
            FROM Book_Issue__c
            WHERE Book__c IN :bookIds
            AND Member__c IN :memberIds
        ];

        for(Book_Issue__c issue : newIssues){
            for(Book_Issue__c existing : existingIssues){

                if(issue.Book__c == existing.Book__c &&
                   issue.Member__c == existing.Member__c){

                    issue.addError('This member has already issued this book.');
                }
            }
        }
    }

    // Update related Book status
    public static void updateBookStatus(List<Book_Issue__c> updatedIssues){

        List<Book__c> booksToUpdate = new List<Book__c>();

        for(Book_Issue__c issue : updatedIssues){

            if(issue.Book__c != null){

                booksToUpdate.add(
                    new Book__c(
                        Id = issue.Book__c,
                        Status__c = 'Issued'
                    )
                );
            }
        }

        if(!booksToUpdate.isEmpty()){
            update booksToUpdate;
        }

    }

}
