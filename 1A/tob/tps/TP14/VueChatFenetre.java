import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.EventQueue;
import java.awt.FlowLayout;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class VueChatFenetre {
	Chat chat;//MODELE (observé)
	VueChat vc;//Component où sera affiché les messages (observateur)
	JFrame fenetre;

	public VueChatFenetre(Chat modele) {
		chat = modele;
		
		fenetre = new JFrame();
		this.fenetre.setLocation(300, 300);
		
		//Layout
		Container content = fenetre.getContentPane();
		fenetre.setLayout(new BoxLayout(content, BoxLayout.Y_AXIS));//Creation layout colonne
		
		//Bouton Quitter
		JButton bQuitter = new JButton("Quitter");
		content.add(bQuitter);
		
		//TextArea
		vc = new VueChat(chat);
		content.add(vc);
		
		JPanel inputPanel = new JPanel(new BorderLayout());
		content.add(inputPanel);
		
		JLabel meLabel = new JLabel("Moi: ");
		JTextField entreeMessage = new JTextField("Type your message here");
		JButton bEnvoyer = new JButton("Envoyer");
		
		inputPanel.add(meLabel, BorderLayout.WEST);
		inputPanel.add(entreeMessage, BorderLayout.CENTER);
		inputPanel.add(bEnvoyer, BorderLayout.EAST);
		
		//Affichage
		this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// afficher la fenêtre
		this.fenetre.pack();			// redimmensionner la fenêtre
		this.fenetre.setVisible(true);	// l'afficher
	}

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				Chat modelePrincipale = new Chat();
				new VueChatFenetre(modelePrincipale);
				new VueChatFenetre(modelePrincipale);

			}
		});

	}

}
