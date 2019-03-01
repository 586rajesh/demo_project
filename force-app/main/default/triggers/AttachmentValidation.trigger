/*

Avoiding Duplicate Attachments in Classic Account-->record-->realted attachments  on Name basis 
and avoding update the name of attachment once uploaded.

*/
trigger AttachmentValidation on Attachment (before insert,before update) {
    List<id> newids = new List<id>();
    List<Attachment> atc = new List<Attachment>();
    List<Account> acclist = new List<Account>();
    for(Attachment att : trigger.new){
        newids.add(att.ParentId);
    }
    Map<id,Attachment> mapofaatchments = new Map<id,Attachment>();
    if(!newids.isEmpty()){
        atc = [select id,name,ParentId from Attachment where ParentId in : newids];
        for(Attachment a : atc){
            mapofaatchments.put(a.ParentId,a);
        }
    }
    if(trigger.isInsert){
        for(Attachment at : trigger.new){
            Attachment objattach = mapofaatchments.get(at.ParentId);
            if(objattach!=null){
                at.addError('No more than one Attachment(s) allowed to upload for an Account');
            }
        }
    }
    if(trigger.isUpdate){
        for(Attachment ac : trigger.new){
            if(ac.name!=trigger.oldMap.get(ac.id).name){
                    ac.addError('No further update allowed on Attachment name !');
            }
        }
    }
}