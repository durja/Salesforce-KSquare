import applyForJob
    from '@salesforce/apex/PlacementController.applyForJob';

handleApply(event) {

    applyForJob({
        studentId: this.studentId,
        jobId: event.detail.jobId
    })
    .then(() => {
        console.log('Application submitted');
    })
    .catch(error => {
        console.error(error);
    });
}
