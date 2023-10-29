@isTest
public class DailyLeadProcessorTest {
    @testSetup
    static void setupTestData() {
        // Insert 200 Lead records with blank LeadSource field
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(FirstName = 'Test', LastName = 'Lead' + i));
        }
        insert testLeads;
    }
    
    @isTest
    static void testLeadUpdate() {
        // Schedule the DailyLeadProcessor
        Test.startTest();
        DailyLeadProcessor leadProcessor = new DailyLeadProcessor();
        String cronExp = '0 0 0 * * ?'; // Daily at midnight
        System.schedule('DailyLeadProcessorTest', cronExp, leadProcessor);
        Test.stopTest();
        
        // Verify that all Lead records were updated correctly
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'All Lead records should be updated to Dreamforce');
    }
}