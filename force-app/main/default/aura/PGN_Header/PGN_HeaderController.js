({
	/*
	*  Get the changed record count pass the count to the event
	*  Fire the event
	* */
    changeRecordNumber : function(component, event, helper) {
        var currentPagesCount  = component.find("selectItem").get("v.value");
        var myEvent = $A.get("e.c:PGN_PageTotalChange");
        myEvent.setParams({ "currnetPagesCount": currentPagesCount});
        myEvent.fire();

	}
})