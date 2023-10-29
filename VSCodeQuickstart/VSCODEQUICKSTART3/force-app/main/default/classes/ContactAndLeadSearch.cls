public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchString) {
        // Define the SOSL query to search for Contacts and Leads
        String soslQuery = 'FIND \'' + searchString + '*\' IN ALL FIELDS ' +
                           'RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)';
        
        // Execute the SOSL search
        List<List<sObject>> searchResults = Search.query(soslQuery);
        
        return searchResults;
    }
}