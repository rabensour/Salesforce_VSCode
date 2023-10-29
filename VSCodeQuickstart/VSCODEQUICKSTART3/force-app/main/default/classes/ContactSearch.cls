public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {
        // Perform a SOQL query to retrieve contacts matching the criteria
        List<Contact> matchingContacts = [SELECT Id, Name 
                                          FROM Contact 
                                          WHERE LastName = :lastName 
                                          AND MailingPostalCode = :mailingPostalCode];
        
        return matchingContacts;
    }
}