public class LeadProcessor implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext context) {
        // Use a QueryLocator to collect all Lead records in the org
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext context, List<SObject> leadList) {
        List<Lead> leadsToUpdate = new List<Lead>();
        
        // Iterate through the Lead records and update their LeadSource
        for (SObject obj : leadList) {
            Lead lead = (Lead)obj;
            lead.LeadSource = 'Dreamforce';
            leadsToUpdate.add(lead);
        }
        
        // Update the Lead records
        if (!leadsToUpdate.isEmpty()) {
            update leadsToUpdate;
        }
    }

    public void finish(Database.BatchableContext context) {
        // Add any post-processing logic if needed
    }
}