public class CandidateSyncService {

    public static void sendCandidate(Id applicationId) {

        System.enqueueJob(
            new CandidateSyncQueueable(applicationId)
        );
    }
}
