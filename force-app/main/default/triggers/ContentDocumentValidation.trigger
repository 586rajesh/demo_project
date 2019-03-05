/*
Avoiding Duplicate File in lightening on Name basis 
*/
trigger ContentDocumentValidation on ContentDocument (before insert,before update) {
    List<String> newTitles = new List<String>();
    List<ContentDocument> ctc = new List<ContentDocument>();
    for(ContentDocument att : trigger.new){
        newTitles.add(att.Title);
    }
    if(newTitles.size()>0){
        ctc = [select Title from ContentDocument where Title IN : newTitles ];
        Set<String> oldTitles = new Set<String>();
        for(ContentDocument a:ctc){
            oldTitles.add(a.Title);
        }
        for(ContentDocument at:trigger.new){
            if(oldTitles.contains(at.Title)){
                at.addError('Duplicate attachment found on same Title');
            }
        }
    }

}