({
    getContactsList : function(component, event, helper) {
    	helper.fetchContacts(component, event, helper);
    },

    newContatc : function(Component,event,helper){
    	var creatcontat = $A.get("e.force:createRecord");
    	creatcontat.setParams({
    		'entityApiName' : 'Contact',
    		'deFaultFieldValues' : {
    			'AccountId' : "0017F00000PoJKqQAN"
    		}
    	});
    	creatcontat.fire();

    }

})