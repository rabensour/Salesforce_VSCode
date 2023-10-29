public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        List<Account> accountsToUpdate = new List<Account>();

        for (Id accountId : accountIds) {
            Integer contactCount = [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
            Account acc = new Account(Id = accountId, Number_Of_Contacts__c = contactCount);
            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}