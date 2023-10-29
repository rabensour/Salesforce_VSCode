@isTest
public class AddPrimaryContactTest {

    @isTest
    static void testAddPrimaryContact() {
        // Insert 50 Account records for BillingState NY
        List<Account> accountsNY = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account newAccount = new Account(
                Name = 'Test Account NY ' + i,
                BillingState = 'NY'
            );
            accountsNY.add(newAccount);
        }
        insert accountsNY;

        // Insert 50 Account records for BillingState CA
        List<Account> accountsCA = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account newAccount = new Account(
                Name = 'Test Account CA ' + i,
                BillingState = 'CA'
            );
            accountsCA.add(newAccount);
        }
        insert accountsCA;

        // Create a Contact record to insert
        Contact contactToInsert = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'johndoe@example.com'
        );

        // Create an instance of AddPrimaryContact and enqueue the job for CA BillingState
        AddPrimaryContact queueableJobCA = new AddPrimaryContact(contactToInsert, 'CA');

        // Enqueue the job
        System.enqueueJob(queueableJobCA);

        // Wait for the asynchronous job to complete
        Test.startTest();
        Test.stopTest();

        // Verify that a Contact record was inserted for each of the 50 Accounts with BillingState CA
        Integer expectedContactCountCA = 50;
        Integer actualContactCountCA = [SELECT COUNT() FROM Contact WHERE Account.BillingState = 'CA'];
        System.assertEquals(expectedContactCountCA, actualContactCountCA);
    }
}