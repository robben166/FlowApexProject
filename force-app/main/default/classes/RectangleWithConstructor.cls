public class RectangleWithConstructor {
    
    Decimal length, breadth;
    public RectangleWithConstructor(Decimal l, Decimal b){
        length = l;
        breadth = b;
    }
    
	public void area(){
     
        Decimal a = length * breadth;
        System.debug('Area = ' + a);
    }
    
    public void perimeter(){
       
        Decimal p =  2 * (length + breadth);
        System.debug('Area = ' + p);
    }
}