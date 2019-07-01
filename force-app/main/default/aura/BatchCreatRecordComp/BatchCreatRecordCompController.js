({
    getContactsList : function(component, event, helper) {
    	component.set('v.columns', [
                {label: 'Contact name', fieldName: 'Name', type: 'text'},
                {label: 'AccountID', fieldName: 'AccountId', type: 'text'}, /*cellAttributes:
                    { iconName: { fieldName: 'trendIcon' }, iconPosition: 'right' }},
                {label: 'Amount', fieldName: 'amount', type: 'currency', typeAttributes: { currencyCode: 'EUR'}},*/
                {label: 'Contact Email', fieldName: 'Email', type: 'email'},
                {label: 'Contact Phone', fieldName: 'Phone', type: 'phone'}
            ]);
    	helper.getcontact(component, event, helper);
    },
    //添加空行
    newrow : function(component, event, helper){
    	var newCandidate = {'sobjectType': 'Contact ',
                                    'Name': '',
                                    'Phone': '',
                                    'Email': ''
                                    
                                   };
    	var temp = component.get("v.contactList");
    	temp.push(newCandidate);
    	component.set("v.contactList", temp);
    	console.log(temp);

    },

    chooseone : function(component, event, helper){
    	var temp = component.get("v.contactList");
    	var tempdata = component.find( "data123");
    	console.log(tempdata);
    	var selectedRows = event.getParam('selectedRows');
    	console.log(selectedRows);
    	for (var i = selectedRows.length - 1; i >= 0; i--) {

    		alert("You selected: " + selectedRows[i].Name);

    	}




    }
})