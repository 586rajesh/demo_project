trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}