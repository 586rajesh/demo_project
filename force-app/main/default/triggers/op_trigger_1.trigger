trigger op_trigger_1 on Opportunity (Before Insert , Before Update) {
    
    for(Opportunity a : Trigger.New){
    if(a.Amount < 5000)
    a.addError('Amount cant be less than 5000');
    }
    

}