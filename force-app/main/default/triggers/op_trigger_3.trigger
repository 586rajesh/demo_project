trigger op_trigger_3 on Opportunity (After Insert) {
    
    Contact c = new Contact();
    
    for(Opportunity o : Trigger.new){
    c.AccountID = o.AccountID;
    c.FirstName = ' Opportunity ';
    c.Lastname = 'Owner';
    Insert c;    
    }
}