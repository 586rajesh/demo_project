trigger EmailTrigger on Email__c (before insert,after insert,before update,after update) {
    if(trigger.isbefore  &&  trigger.isupdate)
    {
        
    }
    if(trigger.isafter  &&  trigger.isupdate)
    {
       
    }
    if(trigger.isafter  &&  trigger.isinsert)
    {	
        EmailSetup obj = new Emailsetup();
        database.executeBatch(obj);
    }
}