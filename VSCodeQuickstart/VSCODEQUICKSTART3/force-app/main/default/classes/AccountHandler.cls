public class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        if (String.isNotBlank(accountName)) {
            try {
                Account newAccount = new Account(Name = accountName);
                insert newAccount;
                return newAccount; // Return the account if insertion is successful
            } catch (DmlException e) {
                System.debug('DML Exception: ' + e.getMessage());
                return null; // Return null if a DML exception occurs
            }
        } else {
            return null; // Return null if the incoming parameter is empty
        }
    } 
}