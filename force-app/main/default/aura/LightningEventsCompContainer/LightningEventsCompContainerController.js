({
        // Function to handle Lightning Event
        handleTotalIncomeComponentEvent : function(component, event, helper) {
                alert('父组件接受并处理！');
                // Getting the value of totalIncome attribute of event using event.getParam()
                var totalIncome = event.getParam('totalIncome');
                // Setting the totalIncome attribute of component with the event's totalIncome attribute value.
                component.set('v.totalIncome', totalIncome);
                event.stopPropagation();
        }
})