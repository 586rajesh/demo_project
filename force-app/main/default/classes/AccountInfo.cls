//To Display Account related info along with contcat and oppurtuties on Account Name basis
public class AccountInfo {
    public string searchBoxstring {get;set;}
    public List <Account> result {get;set;}
    public List <Contact> contactresult {get;set;}
    public List <Opportunity> opportunityresult {get;set;}
    public boolean cflag {get;set;}
    public boolean oflag {get;set;}
    public AccountInfo(){
        cflag = false;
        oflag = false;
        contactresult = new list<Contact>();
        opportunityresult = new list<Opportunity>();
    }
    public void searchbox() {   
    string tempInput = '%' + searchBoxstring + '%';
    String query = 'select ID, Name,(select id,Name,firstname from Contacts),(select id,Name,StageName from Opportunities) from Account where Name LIKE : tempInput limit 1';
    result =  Database.query(query);
    if(result.isEmpty()) {
        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'No account records found wuth that name, please try different name'));
        cflag = false;
        oflag = false;
    }else{
        ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO,'Account records found with the name given '));
    }
    for(Account aIterator : result) {
        if(!aIterator.Contacts.isEmpty()) {
            cflag = true;
            contactresult.addAll(aIterator.Contacts);
        }
        else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'No Contacts records founds'));
        }

        if(!aIterator.Opportunities.isEmpty()) {
            oflag = true;
            opportunityresult.addAll(aIterator.Opportunities);
        }
        else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'No Opportunitys records founds'));
        }
    }
    }
}