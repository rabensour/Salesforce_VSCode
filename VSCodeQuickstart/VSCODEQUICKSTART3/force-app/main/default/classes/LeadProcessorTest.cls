@isTest
public class LeadProcessorTest {
    @isTest
    static void testLeadUpdate() {
        // Insert 200 Lead records
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(FirstName = 'Test', LastName = 'Lead' + i));
        }
        insert testLeads;

        // Create an instance of the LeadProcessor Batch class
        LeadProcessor leadBatch = new LeadProcessor();

        // Start the batch job
        Test.startTest();
        Id batchInstanceId = Database.executeBatch(leadBatch);
        Test.stopTest();

        // Verify that all Lead records were updated correctly
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'All Lead records should be updated to Dreamforce');
    }
}