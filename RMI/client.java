import java.rmi.Naming;
public class client {
    public static void main(String[] args) {
        try{
            Calculator c = (Calculator)Naming.lookup
            ("rmi://localhost:5000/calculator");
            System.out.println(" "+c.add(5,3));
            System.out.println(" "+c.subtract(5,3));
        }catch(Exception e){
            System.out.println(e);

        }
    }
}