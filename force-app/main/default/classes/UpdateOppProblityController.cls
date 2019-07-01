public with sharing class UpdateOppProblityController {
    @AuraEnabled 
    public static Opportunity updateOpp(ID opprecid) { 
    	Opportunity opp = [select id,name,Probability from Opportunity where id =: opprecid];
    	opp.Probability = 20;
    	//sdasda
    	//nihaonihao
    	update opp;
    	return opp;
    }
}