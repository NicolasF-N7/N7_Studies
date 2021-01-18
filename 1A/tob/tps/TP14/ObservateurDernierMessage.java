import java.util.Observable;
import java.util.Observer;

public class ObservateurDernierMessage implements Observer {

	public ObservateurDernierMessage() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void update(Observable o, Object arg) {
		System.out.println(arg);
	}

}
