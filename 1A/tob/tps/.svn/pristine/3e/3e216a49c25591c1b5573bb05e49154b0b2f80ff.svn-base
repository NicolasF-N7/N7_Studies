import java.awt.Component;
import java.awt.TextArea;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JTextArea;

public class VueChat extends TextArea implements Observer{//TextArea Gere auto le scroll
	private Chat modele;
	
	public VueChat(Chat c) {
		super();//constructeur du textArea
		modele = c;
		modele.addObserver(this);
		this.setEditable(false);
	}
	
	/**
	 * Appelé lorsque Chat est modifié
	 */
	@Override
	public void update(Observable o, Object arg) {
		this.append(arg.toString());//Ajout du message à la fin du textArea
		
	}


}
