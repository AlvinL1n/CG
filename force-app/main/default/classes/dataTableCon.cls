public with sharing class dataTableCon {
	List<Account> accounts;

    public dataTableCon() {
        
    }
    public List<Account> getAccounts() {
        if(accounts == null)
            accounts = [SELECT name, owner.name FROM account LIMIT 10];
        return accounts;
    }
}