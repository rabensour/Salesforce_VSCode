@isTest
public class TestVerifyDate {

    @isTest
    static void testCheckDates() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(15); // Date 15 days in the future
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result);

        date2 = date1.addDays(45); // Date 45 days in the future
        result = VerifyDate.CheckDates(date1, date2);
        Date expectedDate = date1.addMonths(1).toStartOfMonth().addDays(-1); // End of the current month
        System.assertEquals(expectedDate, result);
    }

    @isTest
    static void testDateWithin30Days() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(15); // Date 15 days in the future
        Boolean result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(true, result);

        date2 = date1.addDays(45); // Date 45 days in the future
        result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false, result);

        date2 = date1.addDays(-10); // Date 10 days in the past
        result = VerifyDate.DateWithin30Days(date1, date2); 
        System.assertEquals(false, result);
    }

    @isTest
    static void testSetEndOfMonthDate() {
        Date date1 = Date.newInstance(2023, 9, 15);
        Date result = VerifyDate.SetEndOfMonthDate(date1);
        Date expectedDate = Date.newInstance(2023, 9, 30);
        System.assertEquals(expectedDate, result);
    }
}