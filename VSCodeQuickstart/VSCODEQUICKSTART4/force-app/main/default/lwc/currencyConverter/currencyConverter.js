import { LightningElement, track } from 'lwc';
import convert from '@salesforce/apex/CurrencyConverterService.convert';

export default class CurrencyConverter extends LightningElement {

  sourceCurrency = 'USD';
  targetCurrency = 'GBP';
  amount = '';
  @track convertedAmount;

  get options() {
    return [
        { label: 'US Dollar', value: 'USD' },
        { label: 'Great Britian Pound', value: 'GBP' },
        { label: 'Euro', value: 'EUR' },
        { label: 'Israeli Shekel', value: 'ILS' },
        { label: 'Japanese Yen', value: 'JPY' },
        { label: 'Swiss Franc', value: 'CHF' },
        { label: 'Canadian Dollar', value: 'CAD' },
        { label: 'Australian Dollar', value: 'AUD' },
        { label: 'New Zealand Dollar', value: 'NZD' },
        { label: 'South Korean Won', value: 'KRW' },
        { label: 'Singapore Dollar', value: 'SGD' },
        { label: 'Hong Kong Dollar', value: 'HKD' },
        { label: 'Chinese Yuan Renminbi', value: 'CNY' },
        { label: 'Indian Rupee', value: 'INR' },
        { label: 'Brazilian Real', value: 'BRL' },
        { label: 'South African Rand', value: 'ZAR' },
        { label: 'Swedish Krona', value: 'SEK' },
        { label: 'Russian Ruble', value: 'RUB' },
        { label: 'Norwegian Krone', value: 'NOK' },
        { label: 'Moroccan Dirham', value: 'MAD' }
    ];
  }

  handleSourceChange(event) {
    this.sourceCurrency = event.detail.value;
  }

  handleTargetChange(event) {
    this.targetCurrency = event.detail.value;
  }

  handleAmountChange(event) {
    this.amount = event.detail.value;
  }
  
  handleConvert(event) {
    convert({sourceCurrency:this.sourceCurrency, 
              targetCurrency:this.targetCurrency, 
              amount: this.amount}).then(result => {
        this.convertedAmount = result;
    });
  }

}