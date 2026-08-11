public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c app = [
            SELECT Id, Student_Name__c, Student_Email__c,
                   Branch__c, CGPA__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        Map<String, Object> data = new Map<String, Object>{
            'applicationId' => app.Id,
            'name' => app.Student_Name__c,
            'email' => app.Student_Email__c,
            'branch' => app.Branch__c,
            'cgpa' => app.CGPA__c
        };

        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'callout:Recruitment_API/candidates'
        );

        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(JSON.serialize(data));

        HttpResponse response =
            new Http().send(request);

        System.debug(response.getStatusCode());
        System.debug(response.getBody());
    }
}
