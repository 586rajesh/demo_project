public inherited sharing class DynamicSOQLGenerator {
    
    public String strObjectName {get;set;}
    public Boolean bFlag {get;set;}
    public Boolean bShowTable {get;set;}
    public String strQuery {get;set;}
    public String strFieldName {get;set;}
    Public List<String> leftSelected {get;set;}
    public list<String> lstFields {get;set;}
    public list<SelectOption> lstObjectNames {get;set;}
    public list<SelectOption> lstFiledOptions {get;set;}
    public list<sObject> lstSobjects {get;set;}
    
    map<string, schema.sobjectType> selectobjs = schema.getGlobalDescribe();
    
    public DynamicSOQLGenerator() {
        bFlag = false;
        bShowTable = false;
        leftSelected = new List<String>();
        lstSobjects = new  list<sObject>();
        retriveObjectNames();
    }
    
    public void retriveObjectNames() {
        lstObjectNames = new list<SelectOption>();
        lstObjectNames.add(new selectoption('-None-', '-None-'));
        for ( Schema.SObjectType objIterator : selectobjs.values() ) {
            Schema.DescribeSObjectResult objResult = objIterator.getDescribe();
            if(!objResult.isCustomSetting()) {
                lstObjectNames.add(new SelectOption(objResult.getName(), objResult.getLabel()));
            }
            
        }
    }
    
    public  PageReference getFiledNames() {
        lstFiledOptions = new list<SelectOption>();
        lstSobjects.clear();
        if(!String.isBlank(strObjectName) && strObjectName != '-None-') {
            bFlag = true;
            map<String, Schema.SObjectField> mapFileds = selectobjs.get(strObjectName).getDescribe().fields.getMap();
            list<String> lstOfFieldNames = new list<String>(mapFileds.keySet());
            for(String filedIterator : mapFileds.keySet()) {
                lstFiledOptions.add(new SelectOption(filedIterator, filedIterator));
            }
        }
        else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Please Select Object Form list to query.'));
        }
        return null;
    }
    
    public void buildTheQuery() {
        try{
            if(!leftSelected.isEmpty()) {
                lstSobjects.clear();
                strQuery = null;
                System.debug('leftSelected ==== > '+leftSelected);
                System.debug('strQuery before ====> '+strQuery);
                strQuery = 'SELECT '+String.join(leftSelected, ', ')+' FROM ' + strObjectName;
            }
            else {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Please Select Fields list to query.')); 
            }
        }
        catch(Exception ex) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, ex.getMessage())); 
        }
        
        
    }
    
    public void retriveTheResult() {
        try{
            bShowTable = true;
            System.debug('strQuery after====> '+strQuery);
            
            if(String.isNotBlank(strQuery)) {
                lstSobjects = Database.query(strQuery);
            }
        }
        catch(Exception ex) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, ex.getMessage())); 
        }
    }
    
}