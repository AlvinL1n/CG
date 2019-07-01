({
	handleClick : function(component, event, helper) {
		var oppid = component.get("v.recordId");
		helper.helperMethod(component,oppid);
	}
})