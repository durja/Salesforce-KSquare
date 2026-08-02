public class BooksFuture {

    @future
    public static void updateBookStatus(Id bookId) {

        Books__c book = [
            SELECT Id, Name
            FROM Books__c
            WHERE Id = :bookId
        ];

        book.Name += ' Updated';
        update book;
    }
}
