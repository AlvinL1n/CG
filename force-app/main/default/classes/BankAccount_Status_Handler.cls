public with sharing class BankAccount_Status_Handler {
    public static void updateExpireStatus(Set<ID> ids){
    	List<BankAccount__c> BAS = new List<BankAccount__c>();
    	for(BankAccount__c obj:[SELECT Id, ExpireDate__c FROM BankAccount__c]){
    		obj.status__c = '过期';
    		BAS.add(obj);
    	}
    	update BAS;
    }
}