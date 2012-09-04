trigger createdayrecords on Training_Plan__c (after insert) {
//public void calculateWorkingDaysBetweenTwoDates(Date date1,Date date2)
               
               public boolean checkifItisWorkingDay(Date currentDate,List<Holiday> holidays){
                 Date weekStart  = currentDate.toStartofWeek();
                for(Holiday hDay:holidays){
                        if(currentDate.daysBetween(hDay.ActivityDate) == 0){
                                 return false;
                        }
                }
               if(weekStart.daysBetween(currentDate) ==0 || weekStart.daysBetween(currentDate) == 6){
                       return false;
                } else 
                       return true;
  }
               
               // training_plan__c trp1 = new training_plan__c();
                    // trp1= trigger.new[0];
                     for(training_plan__c trp1 : trigger.new){
                     
                     Date date1 , date2;
                     date1= trp1.Start_date__c;
                     date2 = trp1.End_date__c;
               List<Holiday> holidays=[Select h.StartTimeInMinutes, h.Name, h.ActivityDate From Holiday h];
               List<Day__c> daylist = new List<day__c>();
             
                Integer allDaysBetween = date1.daysBetween(date2);
                Integer allWorkingDays=0;
                Integer  i=1;
                 date tempdate;
                for(Integer k=0;k<=allDaysBetween ;k++ ){
                   
                    if(checkifItisWorkingDay(date1.addDays(k),holidays)){
                        tempdate =date1.addDays(k);
                          day__c day1 = new day__c();        
                                               
                      
                        allWorkingDays++;
                        day1.date__c=tempdate;
                       
                      
             
                        day1.name = trp1.name+'_' +'Day'+i;
                     
                        system.debug ('hhhhhhhhhhhh' + trp1.id);
                        day1.Training_Plan__c = trp1.id;
                        ++i;
                        daylist.add(day1);
                    } 
                }
                insert daylist;           
               }
         }