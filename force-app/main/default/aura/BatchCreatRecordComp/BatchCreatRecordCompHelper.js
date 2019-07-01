({
    getcontact : function(component, event, helper) {
    	var action = component.get("c.getContacts");
    	var accountId ="0017F00000PoJKqQAN";
    	action.setParam("accountIds", accountId);
    	action.setCallback(this, function (response) {
    		var state = response.getState();
    		if(state == 'SUCCESS'){
    			var contactList = response.getReturnValue();
    			console.log(contactList);
    			component.set("v.contactList", contactList);
    		}else{
    			alert('Error in getting data');
    		}
    	});
    	$A.enqueueAction(action);
    }
})