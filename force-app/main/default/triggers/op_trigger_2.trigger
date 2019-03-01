trigger op_trigger_2 on Opportunity (Before Insert , Before Update) {
    
    for(Opportunity a : Trigger.New){
    
    if(Trigger.isInsert && a.Amount < 5000)
    a.addError('Amount cant be less than 5000');
    
    else if(Trigger.isUpdate && a.Amount < 3000)
    a.addError('Amount cant be less than 3000');
    }

}