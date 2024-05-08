public class PlusSwitch {
    
    public static void switchStatement(String dayOfWeek){
        switch on dayOfWeek{
            when 'Monday'{
                System.debug('１'); 
            }
            when 'Tuesday'{
                System.debug('2'); 
            }
            when 'Wednesday'{
                System.debug('3');
            }
            when else {
                System.debug('4');
            }
        } 
    }
}