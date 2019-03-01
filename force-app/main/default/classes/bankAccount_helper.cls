Public class bankAccount_helper
{
    //upating transactions of relative account
    public Static void updateTransactions(List<Bank_Account__c> accountlist , Map<id,Bank_Account__c> oldMapAccounts){
        List<Transaction__c> updatelist = new List<Transaction__c>();
        for(Bank_Account__c obj : accountlist){
            Transaction__c tn = new Transaction__c();
            if(obj.Current_Balance__c >= 50000){
                tn.Amount__c=obj.Current_Balance__c;
                tn.transaction_type__c = 'Deposit';
                tn.Bank_Account__c=obj.id;
                updatelist.add(tn);            
            }
            if(obj.Current_Balance__c==0.00){
                tn.transaction_type__c = 'closed';
                tn.Bank_Account__c=obj.Id;
                updatelist.add(tn);
            }
        }
        upsert updatelist;
    }
    //after update scenario we cant self object properties after update 
    public Static void updateBranchname(List<Bank_Account__c> accountlist , Map<id,Bank_Account__c> oldMapAccounts){
        List<Branche__c> updateBranch = new List<Branche__c>();    
        for(Bank_Account__c obj : accountlist){
            Branche__c branchobj = new Branche__c();
            if(obj.Current_Balance__c >= 50000){
                branchobj.Id= obj.Branch__c;
                branchobj.name='new Branch yet to be named';
                updateBranch.add(branchobj);
            }
        }
        update updateBranch;
    }
    
    
    Static void updateTransactiondetails(){
        
    }
    //sending welcome mail for all new account holders
    public Static void email_message(List<Bank_Account__c> accountlist ,Map<id,Bank_Account__c> oldMapAccounts){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{}; 
            for(Bank_Account__c obj : accountlist){
                email.setSubject('Net Banking welcomes you !!');
                email.setToAddresses(new List<String>{obj.email__c});
                email.setPlainTextBody('Hi ... '+obj.Account_holder__c+' ....welcome to NET BANKING your account id is ..... '+obj.Id+'   and current balance is .... '+obj.Current_Balance__c);
                emails.add(email);
            } 
        Messaging.sendEmail(emails);
    }
}