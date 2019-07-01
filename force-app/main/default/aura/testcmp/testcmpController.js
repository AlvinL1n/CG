({
	jumptocmp : function(component, event, helper) {
		var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef: "c:testtestet"
        });
    		evt.fire();   
	}
})