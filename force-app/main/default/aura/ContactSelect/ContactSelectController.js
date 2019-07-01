({  
	//初始化
	init: function (cmp, event, helper) { 
		cmp.set('v.mycolumns', [ 
			{label: '姓名', fieldName: 'Name', type: 'text'},  
			{label: '性别', fieldName: 'Gender__c', type: 'text'}, 
            {label: 'Email', fieldName: 'Email', type: 'email'}, 
			{label: 'Phone', fieldName: 'Phone', type: 'phone'} 
		]);
		helper.loadContacts(cmp);
		
	},
    //查询
    getContactName: function (cmp, event, helper) { 
		helper.loadContacts(cmp);
	}, 
    //拿到选中的
	getSelectedName: function (cmp, event) { 

	 	var selectedRows = event.getParam('selectedRows'); 
	 	if(selectedRows.length == 0){
	 		cmp.set('v.contact',null);
	 	}
		for (var i = 0; i < selectedRows.length; i++){
			cmp.set('v.contact',selectedRows[i]);
		} 
	} ,
	//下一步
	Next: function (cmp, event,helper) { 

		var nextFlag       = true;
		var nextstep       = parseInt(cmp.get("v.step")) + 1; //设置步骤
		var con            = cmp.get("v.contact");//联系人
		var childComponent = cmp.find('step2');//拿到子组件

		//进入第二步未选择联系人不允许下一步
		if (nextstep == 2 && con == null ) {
			nextFlag = false;
			helper.showToast("请检查","您未选择任何人,请选择联系人！");
		}

		//进入第三步主题未填写不允许下一步
		if (nextstep == 3 && childComponent.get('v.eMailTemplete').Subject == ''  ) {
			nextFlag = false;
			helper.showToast("请检查","邮件主题为空，请填写主题！");
		}

		//设置步骤
		if (nextFlag) {
	 		cmp.set("v.step",nextstep.toString());
	        //1.1调用子组件方法（功能：当已经选择模板后，回退重新选择联系人，再次回到模板页面需要将新的联系人信息加载到模板中）
	        if (nextstep == 2 && cmp.get('v.eMailTemplete') != null) {
        		childComponent.getEmailTemplete();
	        }
	        //1.2将模板传给父组件,方便其他组件使用
	        if (nextstep == 3) {
	        	cmp.set('v.eMailTemplete',childComponent.get("v.eMailTemplete"));
	        }
		}
	},
	
	//上一步
	Last: function (cmp, event) { 
		var currentstep = parseInt(cmp.get("v.step"));
		//1.拿到子组件
        var childComponent = cmp.find('step2');
        //1.1第二步的时候将模板传给父组件,方便其他组件使用
        if (currentstep == 2) {
        	cmp.set('v.eMailTemplete',childComponent.get("v.eMailTemplete"));
        }
        //上一步
		var laststep = currentstep - 1;
	 	cmp.set("v.step",laststep.toString());
	}

})