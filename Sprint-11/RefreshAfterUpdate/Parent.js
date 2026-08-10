handleProfileSaved() {
    const jobs = this.template.querySelector('c-eligible-jobs');

    if (jobs) {
        jobs.refreshJobs();
    }
}
