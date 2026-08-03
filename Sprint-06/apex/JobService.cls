/* JobService.cls */

public with sharing class JobService {

    public static Job__c getJob(Id jobId) {

        return [
            SELECT Id,
                   Company_Name__c,
                   Minimum_CGPA__c,
                   Eligible_Branches__c,
                   Maximum_Backlogs__c,
                   Application_Deadline__c,
                   Status__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];
    }
}

/* Execute Anonymous Window */

Job__c job = [
    SELECT Id
    FROM Job__c
    LIMIT 1
];

Job__c result = JobService.getJob(job.Id);

System.debug(result);

