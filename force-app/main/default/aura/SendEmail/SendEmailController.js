({
	myAction : function(component, event, helper) {
		
	},
    Search: function(component, event, helper) {
        var searchKeyFld = component.find("searchId");
        var srcValue = searchKeyFld.get("v.value");
        if (srcValue == '' || srcValue == null) {
            // display error message if input value is blank or null
            searchKeyFld.set("v.errors", [{
                message: "Enter Search Keyword."
            }]);
        } else {
            searchKeyFld.set("v.errors", null);
            // call helper method
            helper.SearchHelper(component, event);
        }
    },
    //初始化
	init: function (cmp, event, helper) { 
		cmp.set("v.step",'1');		
	},
    tdClickHandler : function(cmp, event, helper) {
       var mmm = event.currentTarget.getAttribute('data-id');
        cmp.set("v.account",mmm);
        console.log(mmm);
        alert(mmm);
    }
    
})