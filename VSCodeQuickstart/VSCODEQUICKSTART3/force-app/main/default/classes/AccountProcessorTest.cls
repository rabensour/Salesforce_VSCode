@isTest
public class AccountProcessorTest {
    @isTest
    static void testCountContacts() {
        // Create test data: Accounts and associated Contacts
        Account testAccount1 = new Account(Name = 'Test Account 1');
        Account testAccount2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{testAccount1, testAccount2};

        Contact testContact1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount1.Id);
        Contact testContact2 = new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = testAccount1.Id);
        Contact testContact3 = new Contact(FirstName = 'Alice', LastName = 'Johnson', AccountId = testAccount2.Id);
        insert new List<Contact>{testContact1, testContact2, testContact3};

        // Call the @future method
        Test.startTest(); // Start a test context
        AccountProcessor.countContacts(new List<Id>{testAccount1.Id, testAccount2.Id});
        Test.stopTest(); // Stop the test context to ensure batch processing

        // Verify that the 'Number_Of_Contacts__c' field is updated correctly
        testAccount1 = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :testAccount1.Id];
        testAccount2 = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :testAccount2.Id];

        System.assertEquals(2, testAccount1.Number_Of_Contacts__c);
        System.assertEquals(1, testAccount2.Number_Of_Contacts__c);
    }
}