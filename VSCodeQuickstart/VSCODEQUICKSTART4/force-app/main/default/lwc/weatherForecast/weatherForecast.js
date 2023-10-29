import { LightningElement, api, wire } from 'lwc';
import getWeatherForAddress from '@salesforce/apex/WeatherService.getWeatherForAddress';
import getContactAddressById from '@salesforce/apex/WeatherService.getContactAddressById';

export default class WeatherForecast extends LightningElement {
    @api recordId; 
    weatherDescription;
    temperature;
    windSpeed;
    humidity;
    observationTime;

    connectedCallback() {
        this.fetchContactAddress();
    }

    fetchContactAddress() {
        getContactAddressById({ contactId: this.recordId })
        .then(address => {
            this.fetchWeatherInfo(address);
        })
        .catch(error => {
            console.error('Error fetching contact address:', error);
        });
    }

    fetchWeatherInfo(address) {
        getWeatherForAddress({ address: address })
        .then(result => {
            let parsedData = JSON.parse(result);
            this.weatherDescription = parsedData.current.weather_descriptions[0];
            this.temperature = parsedData.current.temperature;
            this.windSpeed = parsedData.current.wind_speed;
            this.humidity = parsedData.current.humidity;
            this.observationTime = parsedData.current.observation_time;
        })
        .catch(error => {
            console.error('Error fetching weather info:', error);
        });
    }
}
