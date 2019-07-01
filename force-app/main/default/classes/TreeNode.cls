public with sharing class TreeNode {
	public String  Jsonstr {get;set;}
	public List<Account> todayacclist = [SELECT ID,NAME,parentid from Account where  createddate = YESTERDAY or id = '0017F00000cw7KT' ];
    public Map<ID,List<Account>> pid_caccs = new Map<ID,List<Account>>();
    public List<Account> sec_accs = new List<Account>();
    public TreeNode() {
    	Jsonstr = '';
        for(Account obj:todayacclist){
        	if(obj.ParentId == '0017F00000cw7KT'){
        		sec_accs.add(obj);
        		continue;
        	}
        	if(!pid_caccs.containsKey(obj.ParentId)){
        		pid_caccs.put(obj.ParentId, new List<Account>());
        	}
        	pid_caccs.get(obj.ParentId).add(obj);
        }
        printTree();
        System.debug('Jsonstr = '+ Jsonstr);
    }
    public String printTree(){
    	Account parentacc = [SELECT ID,NAME FROM Account where id= '0017F00000cw7KT'];
    	Jsonstr += '{id:'+parentacc.Id+',Name:'+parentacc.Name+',children: [';
    	for(Account obj:sec_accs){
    		Jsonstr += '{id:'+obj.Id+',Name:'+obj.Name+',children: [';
    		Jsonstr +=  printchildren(obj.Id);
    		Jsonstr += ']}';
    	}
    	Jsonstr += ']}';
    	
    	return Jsonstr;

    }
    public String printchildren(ID accid){
    	String childstr = '';
    	if(!pid_caccs.containsKey(accid)){
    		return '';
    	}
    	List<Account> childacclist = pid_caccs.get(accid);
    	
    	for(Account obj:childacclist){
    		childstr += '{id:'+obj.Id+',Name:'+obj.Name+',children: [';
    		childstr +=  printchildren(obj.Id);
    		childstr += ']},';
    	}
    	return childstr;
    }


}