import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
public class Calculatorimplementation
extends UnicastRemoteObject 
implements Calculator{
    
    Calculatorimplementation() throws RemoteException{
        super();
    }

    public int add(int a, int b) throws RemoteException {
        return a + b;
    }

    public int subtract(int a, int b) throws RemoteException {
        return a - b;
    }

}

