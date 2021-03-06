@RestResource(urlMapping='/FieldCase/*')
global with sharing class RESTCaseController
{
  @HttpGet
  global static List<Case> getOpenCases()
  {
    String companyName=RestContext.request.params.get('companyName');
     Account company=[select Id,name,BillingState from Account where name=:companyName];
     List <Case> cases=[select id,subject,status,ownerId,Owner.Name from case where AccountId=:company.Id];
     return cases;
     
  }
  @HttpDelete
  global static String deleteOldCases() {
    String companyName = RestContext.request.params.get('companyName');
    Account company = [ Select ID, Name, BillingState from Account where Name = :companyName];
     	
    List<Case> cases = [SELECT Id, Subject, Status, OwnerId, Owner.Name from Case WHERE AccountId =: company.Id AND Status = 'Closed'];
    delete cases;
    
    return 'Closed Cases Deleted';
  }
  
  @HttpPost 
  global static String createNewAccount(String acctName, String descr) {
    Account a =new Account();
    a.Name=acctName;
    a.Description=descr;
    insert a;
     return 'Done';
   }
   
   @HttpPatch
  global static String updateCase(String caseId, String caseStatus, String caseNote) {
    Case companyCase = [SELECT Id, Subject, Status, Description from Case WHERE Id =: caseId];
    
    companyCase.Status = caseStatus;
    companyCase.Description = caseNote;
    update companyCase;
    
    return 'Case Updated';
}
   
}