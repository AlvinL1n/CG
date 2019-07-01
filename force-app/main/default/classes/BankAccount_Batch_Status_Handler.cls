global class BankAccount_Batch_Status_Handler extends Job_Batch_Handler_Abstract {
    
    protected override Database.QueryLocator getQueryLocator() {
        // 初始化，得到需要处理的数据
        return Database.getQueryLocator([SELECT Id, ExpireDate__c FROM BankAccount__c]);
    }
    
    protected override void executeLogic(Set<Id> scopeIds) {
        // 具体的处理逻辑
        BankAccount_Status_Handler.updateExpireStatus(scopeIds);
    }

}