public with sharing class PlacementService {

    public static List<Job__c> getEligibleJobs(Id studentId) {

        return [
            SELECT Id, Name
            FROM Job__c
        ];
    }

    public static Id submitApplication(Id studentId, Id jobId) {

        Application__c app = new Application__c();

        app.Student__c = studentId;
        app.Job__c = jobId;
        insert app;
        ApplicationService.processApplication(app.Id);
        return app.Id;
    }
}
