@isTest
private class ContactSelectController_TEST {
    static testMethod void testMethod1() {
        ContactSelectController.getContacts(null,null);
        ContactSelectController.getContacts(null,'男');
        ContactSelectController.getContacts('name',null);
        ContactSelectController.getContacts('name','男');
    }
}