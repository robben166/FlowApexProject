public class getAccountApexClass {
	
    public static void getDetails()
    {
        Map<String, Object> params = new Map<String, Object>();
        params.put('recordId','001F900001gM5hcIAC');
        
        Flow.Interview.fetchAccountDetails getFlow = new Flow.Interview.fetchAccountDetails(params);
        getFlow.start();
        
        String accName = (String)getFlow.getVariableValue('AccountName');
        System.debug('Account Name := ' + accName);
    }
}