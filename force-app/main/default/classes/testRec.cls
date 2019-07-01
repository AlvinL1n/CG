public class testRec{
    public RecordType rec {get;set;}
    public testRec(){
    
        rec = [select id,toLabel(Name) , DeveloperName from RecordType where DeveloperName = 'Important'];
    }

    @future (callout = true)
    public static void synWithCDH(String accountAdvanceId) {
    	System.debug(LoggingLevel.INFO, '*** 123: ');
    	try{
    		//PageReference pg = Page.exampleConPage;
    		PageReference pg = new PageReference('/apex/exampleConPage');
    		Blob content = pg.getContent();
    		Attachment newAtt = new Attachment();
	        newAtt.ParentId = '0017F00000gLNBPQA4';
	        newAtt.Body = content;
	        newAtt.Name = 'Test Attachment';
	        INSERT newAtt; 
    	}catch(Exception ex){
    		System.debug(LoggingLevel.INFO, '*** ex: ' + ex.getMessage());
    		System.debug(LoggingLevel.INFO, '*** ex: ' + ex.getStackTraceString());
    	}
    	
    }

}