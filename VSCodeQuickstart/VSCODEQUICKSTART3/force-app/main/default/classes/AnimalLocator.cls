public class AnimalLocator {
    public static String getAnimalNameById(Integer animalId) {
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/' + animalId;
        
        String str = '';
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HttpResponse response = new Http().send(request);
        
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>)results.get('animal');

            str = (String) animal.get('name');
     
        } 
            return str;
 
    }
}