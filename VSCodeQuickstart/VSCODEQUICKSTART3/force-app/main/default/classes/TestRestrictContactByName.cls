@isTest
public class TestRestrictContactByName {
    
    @isTest
    static void testValidContact() {
        Contact validContact = new Contact(LastName = 'Smith');
        insert validContact;
    }
    
    @isTest
    static void testInvalidInsert() {
        Contact invalidContact = new Contact(LastName = 'INVALIDNAME');
        try {
            insert invalidContact;
        } catch (DmlException e) {
            System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', e.getDmlMessage(0));
        }
    }
    
    @isTest
    static void testInvalidUpdate() {
        Contact existingContact = new Contact(LastName = 'Smith');
        insert existingContact;
        
        Contact updateToInvalidContact = [SELECT id, LastName FROM Contact WHERE id = :existingContact.id];
        updateToInvalidContact.   LastName = 'INVALIDNAME';
        
        try {
            update updateToInvalidContact;
        } catch (DmlException e) {
            System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', e.getDmlMessage(0));
        }
    }
}