public abstract class Bird implements Flyanimal {
	protected abstract String getAnimalName(); 
    public void fly(){
    	System.debug('我是一只会飞的1231231 : '+getAnimalName());
    }
}