trigger DuplicateContactValidation on Contact (before insert,before update) {
    List<String> newEmailList = new List<String>();
    for(Contact c:trigger.new){
        newEmailList.add(c.email);
    }
    List<String> oldEmailList = new List<String>();
    if(trigger.isInsert){
        if(newEmailList.size()>0){
            Contact oldContacts = [select id,name,email from Contact where email in : newEmailList limit 1];
            if(oldContacts.email!=null)
            oldEmailList.add(oldContacts.email);
        }
        for(Contact con : trigger.new){
            if(oldEmailList.contains(con.email)){
                con.addError('Duplicate Email is not allowed to Enter !');
            }
        }
    }
    if(trigger.isupdate){
        for(Contact cont : trigger.new){
            if(cont.email==trigger.oldMap.get(cont.id).email){
                cont.addError('Duplicate Email is not allowed to update !');
                System.debug(trigger.oldMap.get(cont.id).email);
            }
        }
    }
}