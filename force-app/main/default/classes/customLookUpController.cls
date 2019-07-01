public  class customLookUpController {

    /*public customLookUpController() {
        
    }*/
    @AuraEnabled
    public static List<SObject> fetchresult(String searchkeyword,String ObjectName){
    	String searchkey = '%'+searchkeyword +'%';
    	System.debug('searchkey = '+searchkey);
    	List<SObject> returnlist = new List<SObject>();
		String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchkey  limit 5';    	
    	List < sObject > lstOfRecords = Database.query(sQuery);
    	System.debug('lstOfRecords = '+lstOfRecords);
    	for(SObject obj:lstOfRecords)
    	{
    		System.debug('obj = '+obj);
    		returnlist.add(obj);
    	}

    	System.debug('returnlist ='+returnlist);
    	return returnlist;

    }
}