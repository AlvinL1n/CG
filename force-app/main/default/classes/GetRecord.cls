/**********************************************************************
 * 
 *
 * @url: /services/apexrest/rest
 * @data:
 *  {
        
    }
*************************************************************************/
@RestResource(urlMapping='/Account/*')
global with sharing class GetRecord {
    @HttpPost
    global static Account doPost() {
    	RestRequest request = RestContext.request;
    	System.debug('URI :'+request.requestURI);
    	System.debug('body :'+request.requestBody.toString());
        return [select id , name  from Account limit 1];
    }
}