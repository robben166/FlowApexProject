public class ApexHoursLoops {
    public static void listDemo(){
        List<String> fruits = new List<String>();
        fruits.add('Apple');
        fruits.add('Banana');
        fruits.add('Grapes');
        Integer size = fruits.size();
        for(Integer i = 0; i < size; i++){
            String fruitName = fruits.get(i);
            System.debug(fruitName);
        }
        
        for(String fruit : fruits){
            System.debug(fruit);
        }
        List<Account> accounts = new List<Account>();
        for(Account acc : accounts){
            System.debug(acc.Name);
            System.debug(acc.Industry);
        }
    }
    
    public static void whileDemo(){
        List<String> fruits = new List<String>();
       	fruits.add('Apple');
        fruits.add('Banana');
        fruits.add('Grapes');
        	
        Integer size = fruits.size();
        Integer i = 0;
        while( i < size){
            String fruitName = fruits.get(i);
            System.debug(fruitName);
            i++;
        }
    }
    
    public static void doWhileDemo(){
        List<String> fruits = new List<String>();
       	fruits.add('Apple');
        fruits.add('Banana');
        fruits.add('Grapes');
        
        Integer size = fruits.size();
        Integer i = 10; 
       
        do{
             String fruitName = fruits.get(i);
             System.debug(fruitName);
             i++;
        } while(i < size);
    }
    
    public static void setDemo(){
        Set<String> fruitsSet = new Set<String>();
        fruitsSet.add('Apple');
        fruitsSet.add('Banana');
        fruitsSet.add('Grapes');
        
        for(String fruit : fruitsSet){
            System.debug(fruit);
        }
    }
    
    public static void mapDemo(){
        Map<String, String> countryToCodeMap = new Map<String, String>();
        countryToCodeMap.put('United States','USA');
        countryToCodeMap.put('Bharat/India', 'IN');
        Set<String> keySet = countryToCodeMap.keySet();
        for(String key : keySet){
            System.debug('key =' +key);
            String value = countryToCodeMap.get(key);
            System.debug('Value ='+value );
        }
        for(String val : countryToCodeMap.values()){
            System.debug('val = ' + val);
        }
    }
}