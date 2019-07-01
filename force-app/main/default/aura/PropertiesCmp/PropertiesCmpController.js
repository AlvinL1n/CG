({
    doInit : function(component, event, helper) {
    	console.log('======');
        var action = component.get('c.getData');
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set('v.obj', result);
                console.log(result);
                console.log(result['0017F00000PgOj1QAF']);
            }
        });
        $A.enqueueAction(action);
    }
})