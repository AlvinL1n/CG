public with sharing class Trainning {

    public String name {get{
    		System.debug(LoggingLevel.INFO, '*** get: ' + name);
    		return this.name;
    	} set{
    		System.debug(LoggingLevel.INFO, '*** set: ' + name);
    		this.name = value + '0';
    	}
    }

}