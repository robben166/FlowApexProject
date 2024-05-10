public class FlowBuilder {
    
    @InvocableMethod(label = 'Create an Account')
    public static void createAccount(){
        Account ac = new Account();
        ac.Name = 'Proof';
        ac.Rating = 'Hot';
        
        insert ac;
    }
}