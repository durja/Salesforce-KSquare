/* ApplicationService.cls */

public with sharing class ApplicationService {

    public static String checkDuplicateApplication(Id studentId, Id jobId) {

        List<Application__c> applications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
        ];

        if (!applications.isEmpty()) {
            return 'Duplicate Application! Student has already applied.';
        }

        return 'No Duplicate Found. Continue Application.';
    }
}

/* Execute Anonymous Window */

Student__c stu = [
    SELECT Id
    FROM Student__c
    LIMIT 1
];

Job__c job = [
    SELECT Id
    FROM Job__c
    LIMIT 1
];

String result = ApplicationService.checkDuplicateApplication(stu.Id, job.Id);

System.debug(result);

