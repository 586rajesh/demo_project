trigger Bank_Account_Trigger on Bank_Account__c (before update , after update , after insert) {
    if(trigger.isbefore  &&  trigger.isupdate)
    {
        
    }
    if(trigger.isafter  &&  trigger.isupdate)
    {
        bankAccount_helper.updateBranchname(trigger.new,trigger.oldmap);
        bankAccount_helper.updateTransactions(trigger.new,trigger.oldmap);
    }
    if(trigger.isafter  &&  trigger.isinsert)
    {	//for new batch account holders        
        bankAccount_helper.email_message(trigger.new,trigger.oldmap);    
        //for single customer
        // bankAccount_helper.email_message('rajthota2008@gmail.com', 'Net Banking welcomes you !!', 'message');
    }
    
}