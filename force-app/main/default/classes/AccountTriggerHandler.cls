public class AccountTriggerHandler {
	
    public static void sendEmailOnAfterDelete(List<Account> accListOld){
        List<Messaging.SingleEmailMessage> emailObjs = new List<Messaging.SingleEmailMessage>();
        for(Account accOld : accListOld){
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List <String>();
            emailAddress.add(UserInfo.getUserEmail());
            emailObj.setToaddresses(emailAddress);
            emailObj.setSubject('Account has been successfuly deleted ' + accOld.Name);
            emailObj.setPlainTextBody('');
            emailObjs.add(emailObj);
        }
        Messaging.sendEmail(emailObjs);
    }
}