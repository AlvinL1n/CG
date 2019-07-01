({
    helperMethod : function() {

    },
    createItem : function(component){

        var campingItem = component.get("v.newItem");
        console.log(campingItem);

        var adItemEvent = component.getEvent('addItem');
        adItemEvent.setParams({'item': campingItem});
        adItemEvent.fire();
        component.set("v.newItem", {'sobjectType': 'Camping_Item__c'});
        console.log('Event fired');
    }
})