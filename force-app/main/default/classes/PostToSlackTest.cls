@isTest(SeeAllData=true)
public class PostToSlackTest {
	static testMethod void testPost() {
		Boolean success = true;
		try {
		PostToSlack.Vars testvars = new PostToSlack.Vars();
            testvars.messageBody = '{"Text":, "Test"}';
            testvars.slackURL = 'https://hooks.slack.com/services/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';	
		PostToSlack.postToSlack(new List<PostToSlack.Vars> { testvars });
		} catch (Exception e) {
			success = false;
		} finally {
			System.assert(success);
		}
	} 
}