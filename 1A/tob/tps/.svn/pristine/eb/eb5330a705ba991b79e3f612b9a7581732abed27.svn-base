package allumettes;
import java.util.HashSet;

public class StrategieExpert implements Strategie {

	public StrategieExpert() {
	}

	@Override
	public int nbAllumettesARetirer(Jeu jeu) {
		int resteModulo4 = jeu.getNombreAllumettes() % 4;
		switch(resteModulo4) {
			case 2: return 1;//Gagné
			case 3: return 2;//Gagné
			case 0: return 3;//Gagné
			case 1: return 1;//Perdu
			default: return 0;//Ce cas n'arrive jamais
		}
	}

}
