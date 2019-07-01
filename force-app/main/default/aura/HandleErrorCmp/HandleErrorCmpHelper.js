({
    handleServerAction : function(component,actionName,params,callback) {
    	console.log(actionName)
    	var action = component.get(actionName);
    	action.setParams(params);
        this.setupAction(component, action, callback) ;       
        $A.enqueueAction(action); 
    },
    setupAction : function(component, action, callback) { 
  	console.log(222)
        action.setCallback(this, function(response){
        	console.log(222)
            this.handleResultsCallBack(component, response, callback);
        }); 
    },
      
    handleResultsCallBack : function(component, response, callback) {
  		console.log(333)
        var responseState = response.getState();
        var responseError = response.getError();
        var responseValue = response.getReturnValue();
  		console.log(responseState)
  		console.log(responseValue)
        switch(responseState){
  
            default: break;
            case 'NEW': break;
            case 'RUNNING': break;
  
            case 'SUCCESS':
                  
                /*if(!$A.util.isEmpty(responseValue)){*/
                     /*if (callback) {*/
                     	console.log(213)
                         callback(response.getReturnValue());
                     /*}*/
                /*}*/
                  
                break;
                  
            case 'INCOMPLETE': break;
            case 'ERROR': 
                console.log('Response Error-->'+this.handleErrors(responseError));
                break;
        }
          
    },
    handleErrors : function(errors) {
	    // Configure error toast
	    let toastParams = {
	        title: "Error",
	        message: "Unknown error", // Default error message
	        type: "error"
	    };
	    // Pass the error message if any
	    if (errors && Array.isArray(errors) && errors.length > 0) {
	        toastParams.message = errors[0].message;
	    }
	    // Fire error toast
	    let toastEvent = $A.get("e.force:showToast");
	    toastEvent.setParams(toastParams);
	    toastEvent.fire();
	},
    handleServerActionPromise : function (cmp,action,helper,self) {
        // body...
        var accountPromise = this.executeAction(cmp, action);
        accountPromise.then(
            function(result){
                cmp.set('v.account', result);
                let contAction = cmp.get("c.getContact");
                var contParams={"accountIdStr":result.Id};
                contAction.setParams(contParams);
                var contPromise = helper.executeAction(cmp, contAction);
                return contPromise;
            }
        )
        .then(
        
             $A.getCallback(function(result){
                 cmp.set('v.con', result);
             })
        )
        .catch(
             $A.getCallback(function(error){
                 alert('An error occurred : ' + error);
                 //$A.reportError("error message here", error);
             })
        ); 
    },
    //return promise
    executeAction: function(cmp, action, callback) {
        return new Promise(function(resolve, reject) {
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    console.log(action)
                    var retVal=response.getReturnValue();
                    resolve(retVal);
                }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            reject(errors[0].message);
                        }
                    }
                    else {
                        reject("Unknown error");
                    }
                }
            });
            $A.enqueueAction(action);
        });
    }
})