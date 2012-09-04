trigger checkTrainer on Session__c (Before Insert, Before Update)
{
    // commit1
    //commit2
    Session__c s= trigger.new[0];
    try{
    Trainer__c t = [Select RecordTypeId, Id, RecType__c from Trainer__c where id=:s.trainer__c];
    if(t.RecType__c=='Mentor')
        {
            s.adderror('A mentor cannot take a theory or lab session');
        }
    }
    catch(Exception e){}
}