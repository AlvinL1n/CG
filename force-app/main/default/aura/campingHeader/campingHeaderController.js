({
    packItem : function(component, event, helper) {
        //set the Packed__c property of the item (instance of Camping_Item__c) attribute
        component.set("v.item.Packed__c",true);
        //set the disabled attribute to true
        event.getSource().set("v.disabled",true);
    }
})