/*  StudentService.cls  */

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

/* Execute Anonymous Window */

Student__c stu = [
    SELECT Id
    FROM Student__c
    LIMIT 1
];

Student__c result = Student.getStudent(stu.Id);

System.debug(result);
