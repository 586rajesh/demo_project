@isTest
public class AccountNewTest
{
    static testMethod void addNewAccount()
    {
        Account acc=new Account();
        acc.Name='CHASE BANK';
        acc.NumberOfEmployees=12;
        insert acc;
    }
    
     static testMethod void addNewAccountWitoutAcctName()
    {
        Account acc=new Account();
        acc.Name='Steve Account';
        acc.NumberOfEmployees=12;
        insert acc;
    }
}