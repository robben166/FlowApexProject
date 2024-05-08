public class SendEmailWithTemplate {
    public static void sendEmailNotification(){
        EmailTemplate et = [SELECT Id, Subject, Body FROM EmailTemplate WHERE Name = 'ContactInfomationTemplate'];
        Contact con = [SELECT Id, Name, Email FROM Contact WHERE Email = 'robben166@gmail.com' limit 1];
        String[] toAddress = new String[]{'robben166@gmail.com'};
        String[] ccAddress = new String[]{'robben166@gmail.com'};
        String[] bccAddress = new String[]{'robben166@gmail.com'};
            
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        
        Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
        myEmail.setTemplateId(et.Id); //pass email template id here
        myEmail.setTargetObjectId(con.Id); //pass record id here 
        
        myEmail.setToAddresses(toAddress);
        myEmail.setCcAddresses(ccAddress);
        myEmail.setBccAddresses(bccAddress);
        myEmail.setSaveAsActivity(false);
        myEmail.setUseSignature(false);
        emailList.add(myEmail);
        Messaging.sendEmail(emailList);
    }
}