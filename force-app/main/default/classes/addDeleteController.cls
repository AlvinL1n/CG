public with sharing class addDeleteController {

    @AuraEnabled
    public static void saveContacts(List<Contact> ListContact){
        System.debug('212131231321');
        Insert ListContact;
    }
}