({
    doInit: function (component, event, helper) {
        helper.getAllSobjectRecords(component, component.get("v.pageNumber"), component.get("v.currentPagesCount"));
    },
    pageChange: function(component, event, helper) {
        var pageNumber = event.getParam("pageNumber");
        var currnetPagesCount = event.getParam("currnetPagesCount");

        component.set("v.pageNumber", pageNumber);
        component.set("v.currentPagesCount", currnetPagesCount);

        helper.getAllSobjectRecords(component, pageNumber, currnetPagesCount);
    },

    recordCounterChange : function(component, event, helper){
        var currnetPagesCount = event.getParam("currnetPagesCount");
        component.set("v.pageNumber", '1');
        component.set("v.currentPagesCount", currnetPagesCount);
        helper.getAllSobjectRecords(component,'1', currnetPagesCount);
    }
})