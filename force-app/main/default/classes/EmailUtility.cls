public class EmailUtility {
    public static void sendEmail(){
        Messaging.SingleEmailMessage email = new Messaging.singleEmailMessage();
       email.setSubject('My First Email From Salesforce');
    
       List<String> toAddress = new List<String>();
       toAddress.Add('robben166@gmail.com');
    
      List<String> bccAddress = new List<String>();
      bccAddress.add('robben166@gmail.com');
    
     email.setPlainTextBody('こんにちわ');
     email.setToAddresses(toAddress);
     email.setBccAddresses(bccAddress);
    
      List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();
      emailMessages.add(email);
       List<Messaging.SendEmailResult> sendEmailResults = Messaging.sendEmail(emailMessages, false);
        for(Messaging.SendEmailResult sr : sendEmailResults){
            Boolean isSuccess = sr.isSuccess();
            if(isSuccess){
                System.debug('メールは送られました');
            }else {
                System.debug('エラー発生');
                List<Messaging.SendEmailError> errors = sr.getErrors();
                System.debug(errors);
            }
        }
    }
}