({
	helperMethod : function(cmp,id) {
		var action = cmp.get("c.updateOpp");
		action.setParams({
            'opprecid': id 
        });
		action.setCallback(this, function(response){

			var state = response.getState();

			if (state === "SUCCESS") {

				cmp.set("v.message", "更新成功，当前可能性为  20% ");

			}
			//$A.get("e.force:closeQuickAction").fire();

		});

		$A.enqueueAction(action);
	}
})