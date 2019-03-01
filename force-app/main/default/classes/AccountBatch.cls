/*
select id,name,phone,Account.phone,Account.industry from Contact where Industry = \'Energy\'

This Batch job updates contact phone with account phone number 
if and only if it is null and account industry is matched with passed constructor parameter value.

How to Excecute :
AccountBatch obj = new AccountBatch('Energy');
ID batchprocessid = Database.executeBatch(obj);
AsyncApexJob aaj = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors 
                    FROM AsyncApexJob WHERE ID =: batchprocessid ];
System.debug(aaj.status);

*/
public class AccountBatch implements Database.Batchable<sobject> {
    String strIndustry = null;
    public AccountBatch(String industry){
        this.strIndustry = industry;
    }
    public AccountBatch() {}
    public Database.QueryLocator start(Database.BatchableContext bc){
            String strQuery='select id,name,phone,Account.phone,Account.industry from Contact';
            If(strIndustry != null){
                strQuery += ' where Account.Industry =: strindustry';    
            }
            return Database.getQueryLocator(strquery);
    }
    public void execute(Database.BatchableContext bc, List<Contact> scope){
        List<Contact> lstConsToUpdate = new List<Contact>();
        if(scope != null && !lstConsToUpdate.isEmpty()) {
            for(Contact conIterator : scope){
                if(conIterator.Account.industry == 'Energy'){
                    if(conIterator.phone == null){
                        conIterator.phone = conIterator.Account.phone;
                        lstConsToUpdate.add(conIterator);
                    }
                }
            }
        }
        update lstConsToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        /*
            * We can also call Apex Batch program depending on this current status;
            * We can also send Email alert on Batch job status details.
        */
    }
}