@isTest
public class AccountManagerTest {
    @isTest public static void testGetAccount() {
        Account acc = new Account(Name = 'Babar');
        insert acc;
        Contact cont = new Contact(LastName = 'Boufon', AccountId = acc.Id);
        insert cont;
        Id recordId = acc.id;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        System.assert(thisAccount != null);
    }
}