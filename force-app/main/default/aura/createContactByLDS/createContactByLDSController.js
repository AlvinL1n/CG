({
    doInit: function(component, event, helper) {
        helper.openNewContact(component);
    },
 
    saveContact: function(component, event, helper) {
        if(helper.validateContactForm(component)) {
            component.set("v.newContactFields.AccountId", component.get("v.recordId"));
            component.find("contactRecordCreatorId").saveRecord(function(saveResult) {
                if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
 
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Success! ",
                        "message": "The new contact was created.",
                        "type":"success"
                    });
 
                    $A.get("e.force:closeQuickAction").fire();
                    resultsToast.fire();
 
                    $A.get("e.force:refreshView").fire();
                    helper.openNewContact(component);
                }
                else if (saveResult.state === "INCOMPLETE") {
                    console.log("User is offline, device doesn't support drafts.");
                }
                else if (saveResult.state === "ERROR") {
                    console.log('Problem saving contact, error: ' +
                                 JSON.stringify(saveResult.error));
                }
                else {
                    console.log('Unknown problem, state: ' + saveResult.state +
                                ', error: ' + JSON.stringify(saveResult.error));
                }
            });
        }
    },
 
    doReset: function(component, event, helper) {
        //$A.get("e.force:closeQuickAction").fire();
        helper.openNewContact(component);
    },
})