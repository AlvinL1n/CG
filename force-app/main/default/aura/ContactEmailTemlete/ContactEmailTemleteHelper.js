({
    loadEmailTemplete: function(cmp) {
        var action = cmp.get("c.getEmailTempletes");
        cmp.set("v.spinner",true);
	    action.setCallback(this, function(response) {
		    var state = response.getState();
		    if (state === "SUCCESS") {
		      cmp.set("v.eMailTempletes", response.getReturnValue());
		      cmp.set("v.eMailTemplete", response.getReturnValue()[0]);
		    }
		    cmp.set("v.spinner",false);
		});
	    $A.enqueueAction(action);
    },
    loadEmailTempleteByContact: function(cmp) {
        var action = cmp.get("c.getEmailSubjectAndBodyByTemplete");
        //所有模板
		var emts = cmp.get("v.eMailTempletes");
		//联系人
		var con = cmp.get("v.contact");
		//选中的值
        var selectedId = cmp.find("select").get("v.value"); 
        cmp.set("v.spinner",true);
		for (var i = 0; i <= emts.length-1; i++) {
			if (emts[i].Id == selectedId) {
        		action.setParams({"et": emts[i],"con":con}); 
				break;
			}
		}
	    action.setCallback(this, function(response) {
		    var state = response.getState();
		    if (state === "SUCCESS") {
		      cmp.set("v.eMailTemplete", response.getReturnValue());
		      this.showToast("","加载成功！");
		    }else{
		      this.showToast("","加载失败！失败原因"+state);
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
  	}

})