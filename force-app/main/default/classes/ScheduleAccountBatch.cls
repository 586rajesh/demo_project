public class ScheduleAccountBatch implements System.Schedulable{
    Public void execute(System.SchedulableContext sc){
        AccountBatch AccountBatchobj = new AccountBatch('Energy');
        Database.executeBatch(AccountBatchobj);
        System.debug('Schedulable batch job runned sucessfully on Account!');
    }
}