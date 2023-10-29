// AnimalLocatorTest.cls
@isTest
public class AnimalLocatorTest {
    @isTest
    public static void testGetAnimalNameById() {
        // Create a mock HTTP response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        // Call the method to be tested
        String animalName = AnimalLocator.getAnimalNameById(1);
        
        // Assert the result
        System.assertEquals('Lion', animalName);
    }
}