public class StringArrayTest {
    public static List<String> generateStringArray(Integer numStrings) {
        List<String> stringList = new List<String>();
        
        for (Integer i = 0; i < numStrings; i++) {
            stringList.add('Test ' + i);
        }
        
        return stringList;
    }
}