public class AddPrimaryContact implements Queueable {
    
    private Contact contactToInsert;
    private String stateAbbreviation;
    
    public AddPrimaryContact(Contact contactToInsert, String stateAbbreviation) { // Constructor
        this.contactToInsert = contactToInsert;
        this.stateAbbreviation = stateAbbreviation;
    }
    
    public void execute(QueueableContext context) {
        List<Account> accountsToUpdate = new List<Account>();
        List<Account> accounts = new List<Account>();
        for (Account acc : accounts) {
            Contact newContact = contactToInsert.clone(false, true, false, false);
            newContact.AccountId = acc.Id;
            accountsToUpdate.add(acc);
        }
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}