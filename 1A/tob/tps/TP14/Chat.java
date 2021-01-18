import java.util.List;
import java.util.Observable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

// MODELE
public class Chat extends Observable implements Iterable<Message>{//extends Observable car les observateurs observent le modele

	private List<Message> messages;

	public Chat() {
		super();
		this.messages = new ArrayList<Message>();//car List est une interface, donc non instanciable
	}

	public void ajouter(Message m) {
		this.messages.add(m);
		
		//Notifier les observateurs
		this.setChanged();
		this.notifyObservers(m);
	}
	
	public Iterator<Message> iterator(){
		return messages.iterator();
	}
}
