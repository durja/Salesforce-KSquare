public with sharing class ApplicationScheduler
implements Schedulable{

    public void execute(SchedulableContext context){

        Database.executeBatch(
            new ApplicationBatch(),
            200
        );
    }
}

/* Anonymous Execute window */

String cron = '0 0 2 * * ?';

System.schedule(
    'Application Daily Batch',
    cron,
    new ApplicationScheduler()
);
