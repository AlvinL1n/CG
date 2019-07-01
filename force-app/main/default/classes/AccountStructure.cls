public class AccountStructure {
	public List<Account> allAccountList;
	public Map<Id, Account> accMap;
	public Map<Id, List<Account>> pid_Children_Map;
	public AccountStructure(Set<Id> accids) {
		this.pid_Children_Map = new Map<Id, List<Account>>();
		this.allAccountList = getAllAccounts(accids);
		this.accMap = new Map<Id, Account>();
		for (Account acc : allAccountList) {
			
			accMap.put(acc.Id, acc);

			if (!pid_Children_Map.containsKey(acc.ParentId)) {
				pid_Children_Map.put(acc.ParentId, new List<Account>());
			}
			pid_Children_Map.get(acc.ParentId).add(acc);
		}
		System.debug('pid_Children_Map ==>'+pid_Children_Map);
	}
	
	public Map<Id, AccountHierachyEntity> getTestMap(){
		Map<Id, AccountHierachyEntity> returnMap = new Map<Id, AccountHierachyEntity>();
		for (Id obj : accMap.keyset()) {

			Account acc = accMap.get(obj);

			AccountHierachyEntity ahe = new AccountHierachyEntity();
			ahe.parentAccount = new Account(id = acc.ParentId);

			List<Account> accList = new List<Account>();
			loadStructure(obj, accList);

			ahe.childAccountList = accList;
			returnMap.put(obj, ahe);
		}
		return returnMap;
	}
	private List<Account> getAllAccounts(Set<Id> accids) {
		return [SELECT Id, Name, ParentId, Parent.ParentId FROM Account WHERE Id IN :accids OR ParentId IN :accids OR Parent.ParentId IN :accids];
	} 
	private void loadStructure(Id accid, List<Account> accs) {
		if (!pid_Children_Map.keyset().contains(accid)) return;
		
		for (Account acc : pid_Children_Map.get(accid)) {
			if (acc.ParentId == accid) { 
				accs.add(acc);
				loadStructure(acc.Id, accs);
			}
		}
	}

	public class AccountHierachyEntity {
		public Account parentAccount;
		public List<Account> childAccountList;
	}
}