public class SyntechProContactsRecords {
    public static void createContact() {
        // Create a new Contact record
        Contact newContact = new Contact();
        newContact.FirstName = 'John';
        newContact.LastName = 'Doe';
        newContact.Email = 'john.doe@example.com';
        newContact.Phone = '123-456-7890';
        // Add more fields as needed

        // Insert the new Contact record into the database
        try {
            insert newContact;
            System.debug('Contact record created successfully. ID: ' + newContact.Id);
        } catch (Exception ex) {
            System.debug('Error creating Contact record: ' + ex.getMessage());
        }
    }
}