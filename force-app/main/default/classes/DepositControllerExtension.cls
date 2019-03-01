public class DepositControllerExtension {
    public string errorMessage{get; set;}
    
    private final Bank_Account__c bankaccount;
    private ApexPages.StandardController stdController;
    //initiliasing controller
    public DepositControllerExtension(ApexPages.StandardController stdController) {
        this.bankaccount = (Bank_Account__c)stdController.getRecord();
        this.stdController = stdController;
    }
    
    public PageReference save(){
        errorMessage='';
        try{
            if(bankaccount.Current_Balance__c !=null){
                bankaccount.Current_Balance__c=bankaccount.Current_Balance__c;
                update bankaccount; 
                System.debug('sucessssss');            
            }
        }
        catch(System.Exception e){
            errorMessage=e.getMessage();
        }
       PageReference redirectonsucess = new ApexPages.StandardController(bankaccount).view();
       redirectonsucess.setRedirect(true);
       return  redirectonsucess;	
    }
    public pagereference backMethod()
    {
        PageReference pg = new ApexPages.StandardController(bankaccount).view(); // Include name of page where user should be navigated after clicking on Back button                                         
        pg.setRedirect(true);
        return pg;
        }
}