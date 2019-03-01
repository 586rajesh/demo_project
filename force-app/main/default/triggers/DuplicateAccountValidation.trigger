//Bulkify Trigger for avoiding duplicate Account(s) on Account Name
trigger DuplicateAccountValidation on Account (before insert,before update) {
        Set<String> nameset = new Set<String>();
        List<Account> Acclist = new List<Account>();
        for(Account acc:trigger.new){
                if(acc.Name != null){
                    nameset.add(acc.Name);
                }
        }
        System.debug(nameset);
        if(nameset.size()>0){
            Acclist = [Select Id,Name from Account where Name IN : nameset];
            Set<String> oldnames = new Set<String>();
            for(Account acc:Acclist){
                oldnames.add(acc.Name);
            }
            for(Account acc:trigger.new){
                    if(oldnames.contains(acc.Name)){
                        acc.addError('Duplicate Account(s) found on given Account Name , please try diffrent name !');
                    }
                }
        }
}