global class EmailSetup implements Database.Batchable<sObject>{
    
    global Database.QueryLocator  start(Database.BatchableContext BC){
        String query = 'select To_Address__c,Subject__c,Body__c from Email__c limit 10000';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC , List<Email__c> oblist){
        List<Email__c> em = new List<Email__c>();
        List<String> addresses = new List<String>();
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{};
            for(Email__c obj:oblist){
                String address =obj.To_Address__c;
                String subject=obj.Subject__c;
                String body =obj.Body__c;
                String attachments = obj.Atttachments__c;
                addresses.add(address);
                email.setSubject(subject);
                email.setToAddresses(addresses);
                email.setPlainTextBody(attachments);
                emails.add(email);
            }
        Messaging.sendEmail(emails);
    }
    global void finish(Database.BatchableContext BC){
        
    }
    
}