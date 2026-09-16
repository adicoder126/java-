import java.rmi.Naming;

public class Server {
    public static void main(String[] args) {
        try{
            Calculatorimplementation c = new Calculatorimplementation();
            Naming.rebind("rmi://localhost:5000/calculator",c);
            System.out.println("RMI server is started");
        }catch(Exception e){
            System.out.println(e);
        }
    }
}




