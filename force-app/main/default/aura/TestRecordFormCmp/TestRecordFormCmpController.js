({
    doInit : function (component, event, helper) {
    	// body...
    	var element1 = component.find('testdiv0').getElement();
        console.log(element1);
    },
    test : function (component, event, helper) {
    	// body...
    	console.log('test');
    	//var element1 = component.find('testdiv0').getElement();
        console.log(component.find('div1').getElement());
    },
    handleSubmit : function(component, event, helper) {
		console.log('submit');
        event.preventDefault(); // Prevent default submit
        var fields = event.getParam("fields");
        console.log(fields);
        fields["Description"] = 'This is a default description'; // Prepopulate Description field
        console.log(fields["Name"]);
        component.find('createAccountForm').submit(fields); // Submit form
	}
})