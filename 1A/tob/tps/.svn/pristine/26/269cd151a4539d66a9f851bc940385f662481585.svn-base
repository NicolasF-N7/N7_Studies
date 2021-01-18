import javax.swing.*;
import java.awt.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.util.*;

/** Programmation d'un jeu de Morpion avec une interface graphique Swing.
  *
  * REMARQUE : Dans cette solution, le patron MVC n'a pas été appliqué !
  * On a un modèle (?), une vue et un contrôleur qui sont fortement liés.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.4 $
  */

public class MorpionSwing {

	// les images à utiliser en fonction de l'état du jeu.
	private static final Map<ModeleMorpion.Etat, ImageIcon> images
		= new HashMap<ModeleMorpion.Etat, ImageIcon>();
	static {
		images.put(ModeleMorpion.Etat.VIDE, new ImageIcon("blanc.jpg"));
		images.put(ModeleMorpion.Etat.CROIX, new ImageIcon("croix.jpg"));
		images.put(ModeleMorpion.Etat.ROND, new ImageIcon("rond.jpg"));
	}

// Choix de réalisation :
// ----------------------
//
//  Les attributs correspondant à la structure fixe de l'IHM sont définis
//	« final static » pour montrer que leur valeur ne pourra pas changer au
//	cours de l'exécution.  Ils sont donc initialisés sans attendre
//  l'exécution du constructeur !

	private ModeleMorpion modele;	// le modèle du jeu de Morpion

//  Les éléments de la vue (IHM)
//  ----------------------------

	/** Fenêtre principale */
	private JFrame fenetre;

	/** Bouton pour quitter */
	private final JButton boutonQuitter = new JButton("Q");

	/** Bouton pour commencer une nouvelle partie */
	private final JButton boutonNouvellePartie = new JButton("N");

	/** Cases du jeu */
	private final JLabel[][] cases = new JLabel[3][3];

	/** Zone qui indique le joueur qui doit jouer */
	private final JLabel joueur = new JLabel();


// Le constructeur
// ---------------

	/** Construire le jeu de morpion */
	public MorpionSwing() {
		this(new ModeleMorpionSimple());
	}

	/** Construire le jeu de morpion */
	public MorpionSwing(ModeleMorpion modele) {
		// Initialiser le modèle
		this.modele = modele;

		// Créer les cases du Morpion
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.cases[i][j] = new JLabel();
			}
		}

		// Initialiser le jeu
		this.recommencer();
		

		// Construire la vue (présentation)
		//	Définir la fenêtre principale
		this.fenetre = new JFrame("Morpion");
		this.fenetre.setLocation(100, 200);
		
		
		//LIAISON DES ACTIONLISTENER
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				final int geti = i;
				final int getj = j;
				this.cases[i][j].addMouseListener(new MouseAdapter() {
					@Override
					public void mouseClicked(MouseEvent e) {
						actionCocherCase(geti,getj);
					}
				});//j : col; i: lignes
			}
		}
		
		boutonNouvellePartie.addActionListener(e -> {
			this.recommencer();
		});
		boutonQuitter.addActionListener(e -> {
			this.quitter();
		});
		
		//CREATION DE LA BAR DE MENU
		JMenuBar menu = new JMenuBar();
		JMenu menuPartie = new JMenu("Partie");
		//Menu recommencer
		JMenuItem menuRecommencer = new JMenuItem(new AbstractAction("Recommencer") {
		    public void actionPerformed(ActionEvent e) {
		        recommencer();
		    }
		});
		/* AVEC MenuKeyListener qui est une INTERFACE
		menuRecommencer.addMenuKeyListener(new MenuKeyListener() {
			public void menuKeyPressed(MenuKeyEvent e) {System.out.println("Menu pressed");}
			
			public void menuKeyReleased(MenuKeyEvent e) {System.out.println("Menu released");}
			
			public void menuKeyTyped(MenuKeyEvent e) {
				
			}
			
		});*/
		menuPartie.add(menuRecommencer);
		//Menu quitter
		JMenuItem menuQuitter = new JMenuItem(new AbstractAction("Quitter") {
		    public void actionPerformed(ActionEvent e) {
		        quitter();
		    }
		});
		
		menuPartie.add(menuQuitter);
		menu.add(menuPartie);
		
		//DEFINITION DE LA VUE
		Container content = fenetre.getContentPane();
		content.setLayout(new GridLayout(4,3));
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				content.add(this.cases[i][j]);//j : col; i: lignes
			}
		}
		
		content.add(boutonNouvellePartie);
		content.add(joueur);
		content.add(boutonQuitter);
		
		//Ajout du menu
		this.fenetre.setJMenuBar(menu);
		
		// Construire le contrôleur (gestion des événements)
		this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// afficher la fenêtre
		this.fenetre.pack();			// redimmensionner la fenêtre
		this.fenetre.setVisible(true);	// l'afficher
	}

// Quelques réactions aux interactions de l'utilisateur
// ----------------------------------------------------

	/** Recommencer une nouvelle partie. */
	public void recommencer() {
		this.modele.recommencer();

		// Vider les cases
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.cases[i][j].setIcon(images.get(this.modele.getValeur(i, j)));
			}
		}

		// Mettre à jour le joueur
		joueur.setIcon(images.get(modele.getJoueur()));
	}
	
	public void quitter() {
		this.modele.quitter();
		System.exit(0);
	}
	
	private void actionCocherCase(int i, int j) {
		try{
			ModeleMorpion.Etat etatJoueur = modele.getJoueur();
			ModeleMorpion.Etat etatAdversaire = (etatJoueur == ModeleMorpion.Etat.CROIX) ? ModeleMorpion.Etat.ROND : ModeleMorpion.Etat.CROIX;
			modele.cocher(i,j);
			
			
			//Modif de l'icon de la case jouee selon le joueur qui vient de jouer
			this.cases[i][j].setIcon(images.get(etatJoueur));
			//Modif de l'icon du joueur actuel (joueur suivant)
			joueur.setIcon(images.get(etatAdversaire));//images.get(modele.getJoueur()));
			
			//Verifier si partie gagné ou terminé
			if(modele.estTerminee()) {
				System.out.println("Joueur: " + this.modele.getJoueur());
				JOptionPane op = new JOptionPane();
				
				op.showMessageDialog(fenetre, modele.estGagnee() ? "Bravo au joueur " + etatJoueur + " vous avez gagné la partie" : "La partie est terminée et aucun joueur n'a gagné.\nOn recommence?");
				this.recommencer();
			}
		}
		catch(CaseOccupeeException error) {
			System.out.println("Case déjà cochée, veuillez en choisir une autre.");
		}
	}



// La méthode principale
// ---------------------

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				new MorpionSwing();
			}
		});
	}

}
