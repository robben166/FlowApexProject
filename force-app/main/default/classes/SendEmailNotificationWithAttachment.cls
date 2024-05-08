public class SendEmailNotificationWithAttachment {
    public static void sendEmail(){
        String columsSTr = 'Id, Name, Amount, StageName\n';
        String attName = 'ClosedWonOpporutnity.csv';
        String[] toAddress = new String[]{'robben166@gmail.com'};
        
        for(Opportunity opp : [SELECT Id, Name, Amount, StageName From Opportunity WHERE StageName= 'Closed Won']){
            String recordString = '"'+opp.Id+'","'+opp.Name+'","'+opp.Amount+'","'+opp.StageName+'"\n';
            columsSTr = columsStr + recordString;
        }
        
        Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName(attName);
        efa.setBody(Blob.valueOf(columsStr));
        
        myEmail.setSubject('Closed Won Opportunity with Amount');
        myEmail.setPlainTextBody('This is testing for send Emails with attachment from Apex class');
        myEmail.setToAddresses(toAddress);
        myEmail.setFileAttachments(new Messaging.EmailFileAttachment[]{efa});
 		
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{myEmail});
    }
}