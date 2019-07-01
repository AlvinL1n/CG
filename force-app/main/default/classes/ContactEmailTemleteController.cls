public with sharing class ContactEmailTemleteController {
    @AuraEnabled 
    public static List<EmailTemplate> getEmailTempletes() { 
        List<EmailTemplate> emP = [SELECT Id,Name, Subject, Body,HtmlValue FROM EmailTemplate WHERE isActive = true];
        return emP;
    }
    @AuraEnabled 
    public static EmailTemplate getEmailSubjectAndBodyByTemplete(EmailTemplate et,Contact con) { 
        if (con == null ) {
            con = new Contact();
        }
        Map<String, String> mapParams = new Map<String, String> {
                 '{!Contact.Id}' => con.Id,
                 '{!Contact.Name}' => con.Name,
                 '{!Contact.Email}' => con.Email,
                 '{!Contact.Phone}' => con.Phone
        };
        for(String key: mapParams.keySet()){
        	et.Subject = et.Subject.replace(key, (mapParams.get(key) == null ? '' : mapParams.get(key)));
            if (et.HtmlValue != null) {
                et.HtmlValue = et.HtmlValue.replace(key, (mapParams.get(key) == null ? '' : mapParams.get(key)));
                et.HtmlValue = et.HtmlValue.replace(']]>','');
            }
        	et.Body = et.Body.replace(key, (mapParams.get(key) == null ? '' : mapParams.get(key)));
        }
       /* if (et.Name == 'ContactLightningEmailTemplete') {
            
            String textBody = et.HtmlValue;
            for (BrandTemplate obj:[SELECT Id,Value,Name FROM BrandTemplate]) {
                et.HtmlValue = obj.Value;
            }
            et.HtmlValue += textBody;
        }*/
        return et;
        /*Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
    	msg.setTemplateId('00X7F000001SWqIUAW');
    	msg.setTargetObjectId('0037F000004XBrMQAW');
    	msg.setSaveAsActivity(false);
    	msg.setCcAddresses(new String[] {'mick.gong@celnet.com.cn'});
    	System.debug(msg.getHtmlBody());*/
    }
    
}