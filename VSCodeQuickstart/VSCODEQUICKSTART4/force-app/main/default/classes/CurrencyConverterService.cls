public with sharing class CurrencyConverterService {

    public CurrencyConverterService() {}

    @AuraEnabled(cacheable=true)
    public static double convert(string sourceCurrency, string targetCurrency, string amount) {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();

        string today = String.valueOf(System.today());

        req.setEndpoint('https://api.apilayer.com/fixer/convert?from=' + sourceCurrency + '&to=' + targetCurrency + '&amount=' + amount + '&date=' + today);
        req.setMethod('GET');
        req.setHeader('apikey', 'Z3XvtG8h7LyG6ZKPPJ0K39pauhFltlvY');

        try {
            res = http.send(req);
            System.debug('Response status: ' + res.getStatus());
            System.debug('Response body: ' + res.getBody());
        } catch(Exception e) {
            System.debug('Error sending request: ' + e.getMessage());
        }

        Map<string, object> responseMap = (Map<string, object>) JSON.deserializeUntyped(res.getBody());

        return (double) responseMap.get('result');
    }
}
