global class CustomerBatch implements Database.Batchable<sObject>{
    public String name;
    public void CustomerBatch(String myname){
        this.name = myname;
    }
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
		return database.getQueryLocator('select id,Account_Type_c from Accoiunt where name='+name);        
    }
    global void execute(Database.BatchableContext bc,List<sObject> scope)   {
        
    }
    global void finish(Database.BatchableContext bc){
        
    }
}