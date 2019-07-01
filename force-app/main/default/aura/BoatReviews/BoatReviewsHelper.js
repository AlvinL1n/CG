({
	onInit : function(component, event) {
        	
        	var boat=component.get("v.boat");
            console.log('boat==>', boat);
            console.log('boat==>', boat.Id);
			var action = component.get("c.getAll");
        	action.setParams({
          	"boatId":boat.Id
        	});
        	 
    		action.setCallback(this, function(response) {
               
                var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    //debugger
                    console.log("responce 111: " + response.getReturnValue());
                    component.set("v.boatReviews", response.getReturnValue());
                    
                }
                else {
                    console.log("Failed with state: " + state);
                }
        	});
    		$A.enqueueAction(action);
	}
})