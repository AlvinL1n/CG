@isTest
private class ContactEmailTemleteController_TEST {
	@isTest(SeeAllData=true)
    static void testMethod1() {
		    Contact cont = new Contact();
  		  cont.FirstName='Test';
  		  cont.LastName='Test';
  		  cont.Gender__c = '男';
        insert cont;
        
        EmailTemplate validEmailTemplate = [select id,HtmlValue ,Body ,Name,Subject from EmailTemplate limit 1];

    
        ContactEmailTemleteController.getEmailTempletes();
        ContactEmailTemleteController.getEmailSubjectAndBodyByTemplete(validEmailTemplate,cont);
    }
}