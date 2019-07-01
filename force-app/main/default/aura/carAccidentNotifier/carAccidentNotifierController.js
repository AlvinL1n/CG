({
	fireCarAccidentEvent  : function(component, event, helper) {
        console.log('fireCarAccidentEvent is called');
		var accidentEvent = component.getEvent("newCarAccident");
        accidentEvent.setParams({"msg":"Car Accident Notification through Component event. Sending ambulance!!!."});
        accidentEvent.fire();
    },
    handlegrandchild  : function(component, event, helper) {
        var getdocotorname= event.getParam("doctorname");
        
        component.set("v.doctorsname", getdocotorname);
    }
})