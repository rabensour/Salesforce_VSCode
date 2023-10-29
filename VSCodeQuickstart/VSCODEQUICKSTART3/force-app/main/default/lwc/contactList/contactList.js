import { LightningElement, wire } from 'lwc';
// Import the Apex method
import getContacts from '@salesforce/apex/ContactController.getContacts';
// Importing the required fields
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

// Importing reduceErrors from ldsUtils
import { reduceErrors } from 'c/ldsUtils';

export default class ContactList extends LightningElement {
    // Define columns for the datatable using the imported fields
    columns = [
        { label: 'First Name', fieldName: FIRST_NAME_FIELD.fieldApiName, type: 'text' },
        { label: 'Last Name', fieldName: LAST_NAME_FIELD.fieldApiName, type: 'text' },
        { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'email' }
    ];

    // Getter to return errors in a readable format
    get errors() {
        return this.contacts.error ? reduceErrors(this.contacts.error) : [];
    }
    // Use @wire to fetch data from the Apex method and store it in 'contacts'
    @wire(getContacts) contacts;
}
