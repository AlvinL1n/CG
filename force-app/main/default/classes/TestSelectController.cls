public with sharing class TestSelectController{
    public List<SelectOption> singleOptions       {get; set;}
    public String myval                            {get;set;}
    public Integer tempint                         {get;set;}
    public TestSelectController(){
        tempint = 0;                         
        List<Account> accList = [select id,name from Account order by Name ];
        singleOptions       =   new List<SelectOption>();
        for(Account obj:accList){
            singleOptions.add(new SelectOption(obj.id,obj.Name));
        }
    
    }
    
    public void switchAcc(){
        singleOptions.clear();
        tempint +=1;
        Integer i = tempint  * 5;
        List<Account> accList = [select id,name from Account order by Name limit 5 offset : i ];
        for(Account obj:accList){
            singleOptions.add(new SelectOption(obj.id,obj.Name));
        }
    }



}