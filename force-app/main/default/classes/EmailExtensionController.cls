public class EmailExtensionController {
    Email__c obj = new Email__c();
    public EmailExtensionController (ApexPages.StandardController stdController)
    { 
        obj = (Email__c)stdController.getRecord();
    }
    
    public Attachment attachment {
        get {
            if (attachment == null)
                attachment = new Attachment();
            return attachment;
        }
        set;
    }
    
    public PageReference save() {
        
        attachment.OwnerId = UserInfo.getUserId();
        attachment.ParentId = '0012800000iCVLi'; // the record the file is attached to
        attachment.IsPrivate = true;
        
        try {
            insert attachment;
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
            return null;
        } finally {
            attachment = new Attachment(); 
        }
        
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
        return null;
    }
    
    
}