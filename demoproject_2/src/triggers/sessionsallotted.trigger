trigger sessionsallotted on Session__c (before insert) {



for (session__c s : trigger.new)
{
   //Session__c ses = [Select trainer__c, Name from Session__c where Name = s.Name]; 
   //Id trainer = s.trainer__c;
   if(s.trainer__c !=NULL){
   List<session__c>  slist = [Select name from Session__c where trainer__c =:s.trainer__c];
   Trainer__c tr1 = new Trainer__c();
      tr1 = [Select name, Sessions_Allotted__c from Trainer__c where id =:s.trainer__c limit 1];
   
   if(slist.size()<3)
   {
     
      
       tr1.Sessions_Allotted__c = slist.size() + 1;
       system.debug ('tttttttt'+tr1.Sessions_Allotted__c);
       update tr1;
   }
   
   else if (slist.size() >= 3)
   {
           s.adderror('More than 3 sessions cannot be allocated to one trainer');      
   }

}
}
}