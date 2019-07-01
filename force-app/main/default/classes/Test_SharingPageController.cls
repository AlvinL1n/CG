public without sharing class Test_SharingPageController {
    public Account acc {get;set;}
    public String accName {get;set;}
    public String accSLA {get;set;}
    public Wrapperopbject wrapobj {get;set;}
    public Account queryacc  {get;set;}
    public Opportunity opp1 {get;set;}
    public Company__c cp  {get;set;}
    public Test_SharingPageController() {
        
        //opp.Company__c = 'a0N7F000002kvcq';
        //wrapobj = new Wrapperopbject(opp);
        queryacc = [SELECT ID ,SLA__c FROM Account WHERE ID = '0017F00000gKgxX'];
        System.debug('queryacc =  '+queryacc);
        queryacc.SLA__c  = 'Silver';
        acc = new Account();
        acc.Name = 'Test-Account343453';
        acc.SLASerialNumber__c = '2';
        acc.Active__c          = 'Yes';
        acc.SLAExpirationDate__c = Date.today();
        acc.SLA__c = 'Gold';
        //wrapobj = new Wrapperopbject(acc);
        
        accName = acc.Name;
        accSLA = acc.SLA__c;

    }
    public void dosave(){
        Account acc1 = [select id from Account where id=:wrapobj.op.AccountId];
        String accid = acc1.Id;
        update queryacc;
        System.debug('queryacc2 =  '+queryacc);
        insert acc;
        //insert cp;
        
    }
    public class Wrapperopbject {
        public Account wrapperAcc {get;set;}
        public String  sla  {get;set;}
        public Opportunity op{get;set;}
        public Wrapperopbject(Opportunity op_w){
            this.op = op_w;
            
        }
    }
}