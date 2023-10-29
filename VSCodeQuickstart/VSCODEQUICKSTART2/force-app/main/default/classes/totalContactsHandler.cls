public class totalContactsHandler {

    public static void countContacts(List<Contact> newList, List<Contact> oldList)

    {

        Set<id> accountIds = new Set<id>();

        if (newList != null) {

            for (contact c:newList) 
        
            {
                if (c.accountId != null)
                {
                    accountIds.add(c.accountId);
                }
            }

        }

        if (oldList != null) {

            for (Contact c:oldList) 
            {
                if (c.accountId != null)
                {
                    accountIds.add(c.accountId);
                }
            }
        }

        List<Account> accounts = [SELECT Id, Total_Contacts__c, (SELECT Id from Contacts) from Account where Id in :accountIds];
        
        if (!accounts.isEmpty()) 
        {
            for (Account acc:accounts)
            {
                acc.Total_Contacts__c = acc.contacts.size();
            }
        }

        update accounts;

    }
}