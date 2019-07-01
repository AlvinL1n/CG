({
    calculate : function(component, event, helper) {
    	
       
        /*helper.handleServerAction(
        	component,
        	"c.triggerBasicAuraHandledError",
        	{},
        	$A.getCallback(response =>
        		{
        			alert(666);
        		}
        		
        	)
        )*/
        var acction = component.get("c.getAccount");
        acction.setParams({});
        helper.handleServerActionPromise(component,acction,helper,self);
        
    }
})