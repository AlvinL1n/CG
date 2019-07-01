({
    handleComponentEvent : function(component, event, helper) {
    	console.log('app  eventhandler')
    	var selectedAccountGetFromEvent = event.getParam("oems");
    	console.log(selectedAccountGetFromEvent)
	    component.set("v.oemlist" , selectedAccountGetFromEvent); 
    }
})