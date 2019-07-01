({
    sendEmailFist : function(cmp) {
    	var flag = false;
    	//异常则还原
    	if (document.getElementById("senderror").style.opacity == "1") {
    		flag = true;
    		document.getElementById("sending").style.transform = "translate(0px,0px)";
    	}
    	//成功提示
    	if (document.getElementById("sendok").style.opacity == "1") {
    		flag = true;
    		cmp.set("v.msg","已发送成功！" );;
    	}
    	//发送邮件
    	if (!flag) {
    		this.sendEmail(cmp);
    	}
    	
    },
    sendEmail:function(cmp){
    	//正常发送
    	cmp.set("v.msg","发送中..." );
    	document.getElementById("sending").style.transform = "translate(0px,-200px)";
    	//$A.util.addClass(cmp.find("sending"), "tranfer")
    	var action = cmp.get("c.SendEmail");
    	// cmp.set("v.spinner",true);
    	action.setParams({"con": cmp.get("v.contact"),"et": cmp.get("v.eMailTemplete")}); 
	    action.setCallback(this, function(response) {
		    var state = response.getState();
		    if (state === "SUCCESS") {
    			/*document.getElementById("sending").style.display = "none";*/
			    cmp.set("v.msg", response.getReturnValue());
    			if (response.getReturnValue() == '发送失败！') {
    				document.getElementById("senderror").style.opacity = "1";
		    	}else{
	    			document.getElementById("sendok").style.opacity = "1";
		    	}
		    }else{
		    	/*document.getElementById("sending").style.display = "none";*/
    			document.getElementById("senderror").style.opacity = "1";
		    }
		    // cmp.set("v.spinner",false);
		});
	    $A.enqueueAction(action);
    }
})