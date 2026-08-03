public with sharing class Student {

    public static Student__c getStudent(Id studentId) {

        return [
            SELECT Id, Name, Student_ID__c, CGPA__c,Branch__c,
                   Active_Backlogs__c, Graduation_Year__c,
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];
    }
}
