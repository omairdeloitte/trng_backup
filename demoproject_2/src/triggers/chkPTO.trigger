trigger chkPTO on Session__c (before insert) {
//commit1
//commit2
//commit3
session__c s = new session__c();
 s= trigger.new[0];
 if(s.trainer__c!=NULL){
 try{
  PTO__c p = new PTO__c();
 p = [Select name, start_date__c , end_date__c from PTO__c where Trainer__c =: s.trainer__c ];
 //if(ISNULL(p.name)){
 //system.debug('kkkkkk');
 //}
 //else{
 date d1, d2 , compdate;
 d1=p.start_date__c;
 d2=p.end_date__c;
 day__c dd=[Select date__c from day__c where id =: s.day__c ];
 compdate = dd.date__c ;
integer c1 ,c2;

system.debug('jjjjjjjjjjj'+compdate);
c1= d1.daysBetween(compdate);
c2=d2.daysBetween(compdate);
 if(c1 >= 0 && c2 < = 0)
    {
      s.addError('The trainer that you are trying to allocate in in PTO for  that time period');  
    }

} Catch(Exception e){}
}}