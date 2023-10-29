public class ContactQuery {
    public static List<Contact> executeQuery() {

        String queryString = 'SELECT Id, Name, Account.Name FROM Contact LIMIT 5';

        return Database.query(queryString);
    }
}