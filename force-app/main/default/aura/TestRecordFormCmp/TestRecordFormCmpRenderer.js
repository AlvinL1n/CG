({
    afterRender : function(component, helper){
        console.log('afterRender');
        this.superAfterRender();
        //var activityId = component.get("v.activityId");
        //if(!$A.util.isEmpty(activityId)){
            var nodeId = "input234";
            //console.log(JSON.stringify(document.getElementById(nodeId)));
            //console.log('nodeId----',nodeId);
            /*var setTimeOut = 0;
            var cb = function(){*/
                /*if(document.getElementById(nodeId)){
                	console.log('111');
                    document.getElementById(nodeId).scrollIntoView();
                }*/
            /*    }
            }
            setTimeout(cb, setTimeOut);*/
        //}
        var element1 = component.find('testdiv0').getElement();
        console.log(JSON.stringify(element1));
        /*var elements1 = component.getElements();
        console.log(elements1);*/
        var db = function () {
        	component.set("v.disabled", false);
        }
        setTimeout(db, 1000);
        /*var input = document.getElementById("input234");
        input.blur();
        console.log(JSON.stringify(document.getElementById(input)));*/
    }
})