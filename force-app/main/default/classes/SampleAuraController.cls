public with sharing class SampleAuraController {
    //Properties
    @AuraEnabled public Map<ID,Account> AccMap {get;set;}
     
    @AuraEnabled
    public static SampleAuraController getData() {
        SampleAuraController obj = new SampleAuraController();
        obj.AccMap = new Map<ID,Account>([SELECT ID,NAME FROM Account ]);
        return obj;
    }
}