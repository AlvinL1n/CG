({
	//初始化
	init: function(cmp, event, helper) { 
        helper.loadEmailTemplete(cmp);
    },

	//得到选中的邮件模板
	getEmailTemplete:function(cmp,event,helper){
		helper.loadEmailTempleteByContact(cmp);
	}

})