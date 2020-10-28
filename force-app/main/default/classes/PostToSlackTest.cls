@isTest(SeeAllData=true)
public class PostToSlackTest {
	static testMethod void testPost() {
		Boolean success = true;
		try {
		PostToSlack.Vars testvars = new PostToSlack.Vars();
            testvars.messageBody = '{"Text":, "Test"}';
            testvars.slackURL = 'https://slack.com/api/api.test';	
		PostToSlack.postToSlack(new List<PostToSlack.Vars> { testvars });
		} catch (Exception e) {
			success = false;
		} finally {
			System.assert(success);
		}
	} 
}
