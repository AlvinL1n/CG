({
	doInit : function(component, event, helper) {
	    var rCount = '';
		helper.getPageCountAndTotal(component,rCount);
	},

    // Go to previous page
	goPreviousPage : function (component, event, helper) {
        var totalPages = component.get("v.pageCounterInfo.totalPages");
        var pageNumber = component.get("v.pageCounterInfo.currentPageNumber");
        var currnetPagesCount = 5;

        var myEvent = $A.get("e.c:PGN_PageChangeEvt");
        myEvent.setParams({
            "pageNumber": (parseInt(pageNumber)-1).toString(),
            "currnetPagesCount": currnetPagesCount.toString()
        });
        myEvent.fire();
    },

    // go to next page
    goNextPage : function (component, event, helper) {
        var totalPages = component.get("v.pageCounterInfo.totalPages");
        var pageNumber = component.get("v.pageCounterInfo.currentPageNumber");
        var currnetPagesCount = 5;

        var myEvent = $A.get("e.c:PGN_PageChangeEvt");
        myEvent.setParams({
            "pageNumber": (parseInt(pageNumber)+1).toString(),
            "currnetPagesCount": currnetPagesCount.toString()
        });
        myEvent.fire();
    },

    // Page count button click and page change
    pageChange: function (component, event, helper) {
        var pageNumber = event.getParam("pageNumber");
        var currnetPagesCount = event.getParam("currnetPagesCount");
        var totalPages = component.get("v.pageCounterInfo.totalPages");
        helper.resetCounters(component, pageNumber, currnetPagesCount,totalPages);
    },

    // Handle current record count change
    recordCounterChange : function (component, event, helper) {
        var currnetPagesCount = event.getParam("currnetPagesCount");
        component.set("v.currnetPagesCount", currnetPagesCount);
	    helper.getPageCountAndTotal(component,currnetPagesCount);
    }
})