({
    setValue : function(component) {
        var record = component.get("v.record");
        var field = component.get("v.field");
        var selections = component.get("v.selections");
        var value = component.get("v.value");

        if(record && field){
            if(field.type === 'reference'){
                if(record[field['relationshipName']]){
                    if(field.disabled){
                        component.set("v.value", record[field['relationshipName']][field.referenceTargetField]);
                        component.set("v.url", '/'+record[field.name]);
                    }
                    if(!$A.util.isEmpty(selections) && record[field.name] == selections[0].id){
                    }else{
                        selections = [];
                        var title = record[field['relationshipName']][field.referenceTargetField];
                        selections.push({id: record[field.name],
                                         title:title,
                                         icon:field.iconName});
                        component.set("v.selections", selections);
                    }

                }else{
                    if(!$A.util.isEmpty(selections)){
                        selections = [];
                        component.set("v.selections", selections);
                    }
                }

            }else{
                if(value != record[field.name] ){
                    component.set("v.value", record[field.name]);
                }

                if(field.type === 'multipicklist'){
                    var inputDelegateCmp = component.find("input-delegate");
                    if(!$A.util.isEmpty(inputDelegateCmp)){
                        return inputDelegateCmp.flush();
                    }
                }
           }

        }
    },
})