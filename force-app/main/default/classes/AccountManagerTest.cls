@isTest
private class AccountManagerTest {
  @isTest
     static void test(){
         Account Acc=new Account();
         acc.Name='test';
         insert acc;
         Contact con=new Contact();
         con.LastName='test';
         con.FirstName='test';
         con.Accountid=acc.id;
         insert con;
        RestRequest request =new RestRequest();
        request.requestURI='https://alvin-home-dev-ed.lightning.force.com/services/apexrest/Accounts/'+acc.id+'/contacts'; 
         request.httpMethod='GET';
         RestContext.request=request;
         Account accs=AccountManager.getAccount();
    }
}