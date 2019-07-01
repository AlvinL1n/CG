public abstract class Job_Batch_Handler_Abstract implements Database.Batchable<sObject> {
    protected abstract Database.QueryLocator getQueryLocator(); // 抽象函数，用于得到需要处理的数据
    protected abstract void executeLogic(Set<Id> scopeIds); // 抽象函数，用于执行具体的逻辑
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return getQueryLocator(); // 动态得到需要处理的数据
    }
    
    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        // 得到需要处理的数据的Id集合
        Set<Id> scopeIds = new Map<Id, SObject>(scope).keySet();
        
        // 进行处理，具体的逻辑需要具体实现
        executeLogic(scopeIds);
    }
    
    public void finish(Database.BatchableContext bc) {}

}