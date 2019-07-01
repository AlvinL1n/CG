({
	handleNotification : function(component, event, helper){
        console.log('handleNotification is called');
        var sentMessage= event.getParam("msg");
        console.log('******sentMessage:'+sentMessage);
        component.set("v.msgFromNotifier", sentMessage);
        helper.PlayAmbulanceSiren(component);
    },
    sendAmbulanceMannually: function(component, event, helper) {
        component.set("v.msgFromNotifier", "sending ambulance mannually");
        helper.PlayAmbulanceSiren(component);
	},
    resetComponent :function(component, event,helper){
        component.set("v.msgFromNotifier", "");
    },
    handlegrandchild1 :function(component, event,helper){
        var getdocotorname= event.getParam("doctorname");
        component.set("v.doctorname2", getdocotorname);
    }
})