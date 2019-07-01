public abstract class Job_Batch_SCH_Abstract implements Schedulable {

    protected abstract String getHandlerName(); // 抽象函数，用于得到具体的类名字

    public void execute(SchedulableContext sc) {
        // 根据开发者定义的类名，新建相应类的实例
        Object o = Type.forName( getHandlerName() ).newInstance();
        
        Job_Batch_Handler_Abstract batch;
        
        // 检查新的实例是否是Job_Batch_Handler_Abstract抽象类的子类。如果是，则执行批量处理
        if ( o != null && o instanceof Job_Batch_Handler_Abstract) {
            batch = (Job_Batch_Handler_Abstract) o;
            
            Database.executebatch( batch, 200 );
        }
    }

}