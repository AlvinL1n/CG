trigger AccountTrigger on Account(before delete, after delete) {

	/*if (Trigger.isDelete) {

		if (Trigger.isBefore) {
			System.debug(LoggingLevel.INFO, '*** before: ');
			delete [SELECT Id FROM Company__c WHERE Account__c IN : Trigger.oldMap.keySet()];
		} else {
			System.debug(LoggingLevel.INFO, '*** after: ');
			
			for (Account acc : Trigger.old) {

				if (acc.Id == '0017F00000zmiMu') {

				} else {
					Trigger.old[0].addError('bad');
				}
			}
			
		}

	}
	*/
    
}