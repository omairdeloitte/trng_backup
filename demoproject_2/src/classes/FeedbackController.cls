public class FeedbackController {
    public Session__c s{get;set;}
    public Session__c sq;
    public String SessionId {get; set;}
    public Feedback__c f;
    public FeedbackController()
        {
        s=new Session__c();
        f=new Feedback__c();
        SessionId = '';
        }

        public String t1{get;set;}
        public String t2{get;set;}
        public String t3{get;set;}
       

    public PageReference cancel() {
     t1=null;
     t2=null;
     t3=null;
     SessionId =null;
     return null;
    }


    public pageReference savef() {
        sq=[select id from Session__c where Session_ID__c =: SessionId];
        
        f.name='feedback';
        f.Session_ID__c=SessionId;
        f.What_was_the_session_like__c=t1;
        f.Improvements_Needed__c=t2;
        f.Overall_Comments__c=t3;
        f.Session__c = sq.id;
        insert f;

        PageReference p = new PageReference('/feedback/FeedbackForm');
        return p;
}
}