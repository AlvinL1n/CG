public with sharing class exampleCon {
	Integer count = 0;
	public List<Account> MyAccounts {get;set;}
    public exampleCon() {
        MyAccounts = [select id,name from Account ];
        
    }
    public PageReference incrementCounter() {
		count++;
		return null;

 
    }
    public Integer getCount(){
    	return count;
    }
}