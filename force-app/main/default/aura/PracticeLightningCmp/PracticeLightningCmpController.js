({
    applyCSS: function(cmp, event) {
        var cmpTarget = cmp.find('changeIt');
        $A.util.addClass(cmpTarget, 'changeMe');
    },
    
    removeCSS: function(cmp, event) {
        var cmpTarget = cmp.find('changeIt');
        $A.util.removeClass(cmpTarget, 'changeMe');
    },
    toggle : function(component, event, helper) {
		var toggleText = component.find("text");
        $A.util.toggleClass(toggleText, "toggle");
    },
    doInit : function(cmp) {
        $A.createComponents([
            ["lightning:button",
            {
                "aura:id": "findableAuraId",
                "label": "Press Me",
                "onclick": cmp.getReference("c.handlePress")
            }],
            ["ui:outputText",{
        		"value" : "qwerewrwq"

    		}]
            ],
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newButton[0]);
                    body.push(newButton[1]);
                    cmp.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    },

    handlePress : function(cmp) {
        // Find the button by the aura:id value
        console.log("button: " + cmp.find("findableAuraId"));
        console.log("button pressed");
    },
    doSomething : function(cmp){
        alert('123');
    },
    doInit2 : function(component, event, helper) {
        var date = new Date();
        component.set("v.datetime", date)
    }

    
})