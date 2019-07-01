({
	loadContacts : function(cmp) {
	    // Load contact data
      cmp.set("v.step","1");
      cmp.set("v.spinner",true);
      var action = cmp.get("c.getContacts");
      action.setParams({"name": cmp.get("v.contactName"),"gender": cmp.get("v.contactGender")}); 
      action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
          cmp.set("v.mydata", response.getReturnValue());
          this.showToast("加载成功","为您查询到"+response.getReturnValue().length+"个联系人.");
          /*$A.util.toggleClass(cmp.find("mySpinner"), "slds-hide");*/
        }else {
          this.showToast("Error!", " Something has gone wrong.");
        }
        cmp.set("v.spinner",false);
      });
    $A.enqueueAction(action);
	},

  // 加载消息
  showToast : function(title,message){
    var toastEvent = $A.get("e.force:showToast");
     toastEvent.setParams({
      "title": title,
      "message": message
    });
    toastEvent.fire();    
  },

})