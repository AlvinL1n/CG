public with sharing class SimpleServerSideController {

    // Exposing a server-side action to Lightning
    @AuraEnabled
    public static String serverEcho(String firstName) {
        return ('Hello from the server, ' + firstName);
    }

    // Best practice: user-friendly error message provided by an AuraHandledException
	@AuraEnabled
	public static CustomExceptionData triggerBasicAuraHandledError() {
	    try {
	        integer a = 1 / 0; // Division by zero causes exception
	        return new CustomExceptionData('success','success',66);
	    }
	    catch (Exception e) {
	        
	        // Throw an AuraHandledException with custom data
			CustomExceptionData data = new CustomExceptionData('MyCustomServerError', e.getMessage(), 123);
			return data;   
	    }
	    
	}	
	@AuraEnabled
	public static Account getAccount() {
		return [SELECT ID,Name FROM Account WHERE Name = 'Greeker Bulk Company2' Limit 1 ];
	}
	@AuraEnabled
	public static Contact getContact(String accountIdStr) {
		return [SELECT ID,Name FROM Contact WHERE AccountId =: accountIdStr Limit 1];
	}
}