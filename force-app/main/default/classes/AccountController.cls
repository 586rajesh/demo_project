public  class AccountController {
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }

  public void myfunction(){
    List<Account> alist = new List<Account>();
    for(Account a:[SELECT id,Name FROM Account where Account.Name like 'uni%']){
        Account obj = new Account();
        obj.BillingCity = 'my city';
    }
  }
}