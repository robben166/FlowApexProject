public class WelcomClass {
	
    @InvocableMethod(label='Display Welcome Message'
                    				description = 'This Metho will return a welcome message'
                    				category = 'PantherSchools'
                    				)
    public static List<String> welcomMessage(){
        List<String > welcomeMessageList = new List<String>();
        welcomeMessageList.add('Welcom to the flow Bootcamp! I am coming from Invocable Apex!');
        return welcomeMessageList;
    }
}