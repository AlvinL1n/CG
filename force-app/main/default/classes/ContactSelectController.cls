public class ContactSelectController {
	//查询联系人
    @AuraEnabled 
    public static List<Contact> getContacts(String name,String gender) { 
    	List<Contact> contacts;
        String newName = name == null?'':name;
        String newGender = gender == null?'':gender;

        if (newName == '' && newGender == '' ) {
        	contacts = [SELECT Id, Name, Phone, Email,Gender__c FROM Contact];
        }else if (newName == '' && newGender != '') {
            contacts = [SELECT Id, Name, Phone, Email,Gender__c FROM Contact WHERE Gender__c =:newGender];
        }else if (newName != '' && newGender == '') {
            contacts = [SELECT Id, Name, Phone, Email,Gender__c FROM Contact WHERE Name like:newName];
        }else{
        	contacts = [SELECT Id, Name, Phone, Email,Gender__c FROM Contact WHERE Name like:newName AND Gender__c =:newGender];
        }
        return contacts;
    }
}