import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// Import metadata for fields to ensure we get API names correctly
import FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import LAST_NAME from '@salesforce/schema/Contact.LastName';
import EMAIL from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
    // Define an array of fields to be included in our form
    fields = [FIRST_NAME, LAST_NAME, EMAIL];

    // Event handler for successful record creation
    handleSuccess(event) {
        // Create a toast notification to show a success message with the new record's ID
        const toastEvent = new ShowToastEvent({
            title: "Contact Created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}
