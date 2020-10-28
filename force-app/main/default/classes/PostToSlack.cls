public with sharing class PostToSlack {

    public class Vars {
        @InvocableVariable(label='Message Body' required=true)
        public String messageBody;
        @InvocableVariable(Label='Webhook URL' required=true)
        public String slackURL;
    }

    @InvocableMethod(label='Post to Slack')
    public static void postToSlack(List<Vars> postVars) {
        Vars o = postVars[0];
        String body = o.messageBody; 
        System.enqueueJob(new QueueableSlackCall(o.slackURL, 'POST', body));
    }

    public class QueueableSlackCall implements System.Queueable, Database.AllowsCallouts {
        
        private final String url;
        private final String method;
        private final String body;
        
        public QueueableSlackCall(String url, String method, String body) {
            this.url = url;
            this.method = method;
            this.body = body;
        }
        
        public void execute(System.QueueableContext ctx) {
            HttpRequest req = new HttpRequest();
            req.setEndpoint(url);
            req.setMethod(method);
            req.setBody(body);
            Http http = new Http();
            HttpResponse res = http.send(req);
        }
    }
}
