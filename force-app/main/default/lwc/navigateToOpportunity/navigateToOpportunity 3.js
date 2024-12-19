import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class FlowRedirect extends NavigationMixin(LightningElement) {
    @api recordId;

    handleFlowFinish() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Opportunity', // Optional
                actionName: 'view'
            }
        });
    }
}