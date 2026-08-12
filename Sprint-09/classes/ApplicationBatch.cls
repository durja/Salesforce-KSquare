public with sharing class ApplicationBatch
    implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator(
            'SELECT Id, Name FROM Application__c'
        );
    }

    public void execute(
        Database.BatchableContext bc,
        List<SObject> scope
    ) {

        for (SObject record : scope) {
            Application__c app = (Application__c) record;

            System.debug(
                'Processing: ' + app.Name
            );
        }
    }

    public void finish(Database.BatchableContext bc) {

        System.debug('Batch Completed');
    }
}

/* Anonymous Execute Window */

Id jobId = Database.executeBatch(
    new ApplicationBatch(),
    200
);

System.debug('Batch Job Id: ' + jobId);
