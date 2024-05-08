public class Rectangle {

    public void area(){
        Decimal length = 5.5,  breadth = 6;
        Decimal a = length * breadth;
        System.debug('Area = ' + a);
    }
    
    public void perimeter(){
        Decimal length = 5.5,  breadth = 6;
        Decimal p =  2 * (length + breadth);
        System.debug('Area = ' + p);
    }
}