import { LightningElement, api } from 'lwc';

export default class GameModalComponent extends LightningElement {
    @api recordId; // ID of the current Game record
    flowInputVariables = [];

    connectedCallback() {
        // Ensure `recordId` is passed to the Flow
        this.flowInputVariables = [
            {
                name: 'gameID', // Variable name expected in the Flow
                type: 'String', // Match the Flow's variable type
                value: this.recordId || '' // Pass the current Game record ID
            }
        ];
    }

    handleCancel() {
        // Dispatch a custom event to close the modal
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }

    handleFlowStatusChange(event) {
        if (event.detail.status === 'FINISHED') {
            console.log('Flow completed successfully.');
            this.handleCancel(); // Close the modal after Flow completion
        } else if (event.detail.status === 'ERROR') {
            console.error('Flow encountered an error:', event.detail.error);
        }
    } 
}