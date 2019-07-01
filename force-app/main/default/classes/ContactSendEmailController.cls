public with sharing class ContactSendEmailController {
    @AuraEnabled 
    public static String SendEmail(Contact con,EmailTemplate et) { 
        String emailStatus  = '发送成功！';
        String body         = et.HtmlValue;
        List<String> emails = new List<String>();
    	emails.add('995841511@qq.com');
    	emails.add(con.Email);
    	try{

	       Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
	        msg.setSubject(et.Subject);
	        msg.setHtmlBody(body);
	    	msg.setToAddresses(emails);
            if (!test.isRunningTest()) {  
	    	  Messaging.sendEmail(new Messaging.SingleEmailMessage[] {msg});
            }
    	}catch(Exception e){
    		emailStatus = '发送失败！'; 
        }
    	return emailStatus;
    }
}