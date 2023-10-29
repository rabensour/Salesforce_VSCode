public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        List<Contact> contactsToGenerate = new List<Contact>();
        for (Integer i = 1; i <= numberOfContacts; i++) {
            Contact newContact = new Contact(
                FirstName = 'Test ' + i,
                LastName = lastName
            );
            contactsToGenerate.add(newContact);
        }

        return contactsToGenerate;
    }
}