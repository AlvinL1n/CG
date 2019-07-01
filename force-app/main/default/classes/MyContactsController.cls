public with sharing class MyContactsController {
   	
   	@AuraEnabled
   	public static List<Contact> getContacts(List<ID> accountIds){
   		List<Contact> contactlist = [SELECT id,Name, AccountId, Phone, Email FROM Contact WHERE AccountId IN : accountIds];
   		return  contactlist;
   	}
}