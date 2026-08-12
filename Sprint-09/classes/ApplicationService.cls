public with sharing class ApplicationService {

    public static void processApplication(Id applicationId) {

        System.enqueueJob(
            new ApplicationPostProcessingJob(applicationId)
        );
    }
}

/* Anonymous Execute Window */

Application__c app = [
    SELECT Id
    FROM Application__c
    LIMIT 1
];

ApplicationService.processApplication(app.Id);
