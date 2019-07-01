({
    calldoctor : function(component, event, helper) {
    	
		var doctorEvent = component.getEvent("doctor");
        doctorEvent.setParams({"doctorname":"Mr.Alvin"});
        doctorEvent.fire();
    }
})