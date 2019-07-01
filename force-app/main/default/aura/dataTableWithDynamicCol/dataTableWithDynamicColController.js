({
    doInit: function(component, event, helper) {
        console.log(111)
        var action = component.get("c.fetchAccount");
        /*action.setCallback(this, function(response) {
            var state = response.getState(); 
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // set searchResult list with return value from server.
                component.set("v.searchResult", storeResponse);
            }
            
        });
        $A.enqueueAction(action);*/

        //action.setStorable(); // Enables client-side cache & makes action abortable

        component.find('actionService')
                .invoke(action)
                .then($A.getCallback(function(entries){
                     //console.log(entries);
                     component.set('v.searchResult', entries);
                }),
                $A.getCallback(function(err) {
                    //console.error(err);

                    var toastEvent = $A.get('e.force:showToast');
                    if (typeof toastEvent !== 'undefined') {
                        toastEvent.setParams({
                            title : 'Server Error',
                            message : err,
                            type : 'error',
                            mode: 'sticky'
                        });
                        toastEvent.fire();
                    }
                }));
    },
    openModel: function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        component.set("v.isOpen", true);
    },
    
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    },
})