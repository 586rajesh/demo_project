trigger accountupdateTrigger on Account (before insert,After update) {
    AccountController obj = new AccountController();
    if(trigger.isUpdate){
        obj.myfunction();
    }
}