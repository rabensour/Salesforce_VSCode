public with sharing class ContactController {
    // Method to retrieve contact records
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        // Throwing an exception to see the error handling in action
        throw new AuraHandledException('This is a forced exception.');
        // Fetch the required fields for contacts
        // return [SELECT FirstName, LastName, Email FROM Contact LIMIT 100];
    }
}