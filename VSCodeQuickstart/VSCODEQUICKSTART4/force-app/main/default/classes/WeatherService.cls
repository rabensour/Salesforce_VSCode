public with sharing class WeatherService {
    private static final String API_ENDPOINT = 'http://api.weatherstack.com/current?access_key=c8501c168efdf2b9ecae5bb99bb5ca02&query=';
    
    @AuraEnabled(cacheable=true)
    public static String getWeatherForAddress(String address) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(API_ENDPOINT + EncodingUtil.urlEncode(address, 'UTF-8'));
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        return res.getBody();
    }

    @AuraEnabled(cacheable=true)
    public static String getContactAddressById(String contactId) {
        Contact con = [SELECT MailingStreet, MailingCity, MailingState, MailingCountry FROM Contact WHERE Id = :contactId LIMIT 1];
        return con.MailingStreet + ', ' + con.MailingCity + ', ' + con.MailingState + ', ' + con.MailingCountry;
    }
}
