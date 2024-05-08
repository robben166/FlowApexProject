public class ExampleClass {
	String name = 'Amit Choudhar';
    Integer age = 34;
    
    public static String address = '123, Main Street';
    
    public static void seyHello(){
        System.debug('Hello, ApexHours!!');
    }
    
    public String greetings(){
        
        System.debug('I am going to return a greeting message');
        return 'Hello, Good Morning ApexHours';
    }
    
    public void greetMessage(){
        name = 'Jitendar Zaa';
        age = 45;
        System.debug('Name is'+name);
        System.debug('Age is' + age  );
    }
    
    public Integer addNumbers(Integer a, Integer b){
        return a + b;
    }
}