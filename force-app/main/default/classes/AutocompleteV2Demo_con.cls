public class AutocompleteV2Demo_con {

    public String targetField { get; set; }
    public String chooseid { get; set; }
    
    public void toacc( ){
    	System.debug('id=='+targetField);
    	//return new PageReference('/'+chooseid);
    }
}