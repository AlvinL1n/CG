({
    AddNewRow : function(component, event, helper){
       // 启动添加事务，子组件注册触发==》父组件监听处理
        component.getEvent("AddRowEvt").fire();     
    },
    
    removeRow : function(component, event, helper){
       //向父组件传值（通过事务）
       component.getEvent("DeleteRowEvt").setParams({"indexVar" : component.get("v.rowIndex") }).fire();
    }, 
  
})