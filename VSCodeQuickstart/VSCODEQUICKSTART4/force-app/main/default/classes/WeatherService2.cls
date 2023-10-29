public with sharing class WeatherService2 {
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
    public static String getAccountAddressById(String accountId) {
        Account acc = [SELECT BillingStreet, BillingCity, BillingState, BillingCountry FROM Account WHERE Id = :accountId LIMIT 1];
        return acc.BillingStreet + ', ' + acc.BillingCity + ', ' + acc.BillingState + ', ' + acc.BillingCountry;
    }
}
