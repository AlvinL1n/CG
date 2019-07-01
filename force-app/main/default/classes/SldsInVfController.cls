public with sharing class SldsInVfController {
	public String inputLastName {get{
							if(inputLastName == null ){
								inputLastName = 'Linnsdujahsdjkahsdjkahsdjkahjksdhajkhsdjkahsjkhdaljknvcjklbnvjidcwerfqwrqwerq3w' ;
							}
							return inputLastName;
						}set;

	}
    public SldsInVfController() {
        
    }
    public void onclick(){
    	System.debug('inputLastName = '+inputLastName);
    }
}