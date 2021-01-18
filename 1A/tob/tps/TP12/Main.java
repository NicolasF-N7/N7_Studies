import java.util.*;
import java.util.stream.Collectors;
import java.io.*;
import java.util.zip.*;
import java.time.LocalDateTime;


/**
 * La classe principale.
 *
 * Tous les traitements demandés sont faits dans la mêthode
 * {@code repondreQuestions}.
 * Il serait plus logique d'écrire des méthodes qui pemettraient d'améliorer
 * la structuration et la réutilisation.  Cependant l'objectif est ici la
 * manipulation de l'API des collections, pas la structuration du code
 * en sous-programmes.
 */

public class Main {

	private static void repondreQuestions(Reader in) {
		Iterable<PointDeVente> iterable = PointDeVenteUtils.fromXML(in);

		// Construire un tableau associatif (pdvs) des points de vente avec un
		// accès par identifiant
		Map<Long, PointDeVente> pdvs = new HashMap<>();


		// Nombre de point de vente
		Set<String> services = new HashSet<String>();
		for(PointDeVente pdv : iterable) {
			pdvs.put(pdv.getIdentifiant(), pdv);
			services.addAll(pdv.getServices());
		}
		int nbPdv = pdvs.size();


		// Afficher le nombre de services existants
		int nbServices = services.size();

		// Afficher les services fournis
		System.out.print("Liste des services");
		services.forEach((String service) -> {System.out.println(service);}); 

		// Afficher le prix du gazole pour le point de vente d'identifiant
		// 31075001 le 25 janvier 2017 à 10h.
		PointDeVente pdvId31075001 = pdvs.get(31075001);
		System.out.print(pdvId31075001.getPrix(Carburant.GAZOLE, LocalDateTime.parse("2017-01-25T10:00:00")));


		// Afficher le nombre de offrant au moins un point de vente


		// Afficher le nombre moyen de points de vente par ville
		HashSet<String> setVilles = new HashSet<String>();
		for(PointDeVente pdv : iterable) {
			setVilles.add(pdv.getVille());
		}
		
		float nbPdvParVilles = nbPdv / (setVilles.size());

		// le nombre de villes offrants un certain nombre de carburants


		// Afficher le nombre et les points de vente dont le code postal est 31200
		ArrayList<PointDeVente> pdv31200 = new ArrayList<PointDeVente>();
		for(PointDeVente pdv : iterable) {
			if(pdv.getCodePostal() == "31200") {
				pdv31200.add(pdv);
				System.out.print(pdv);
			}
		}
		System.out.print(pdv31200.size());

		// Nombre de PDV de la ville de Toulouse qui proposent et du Gazole
		// et du GPLc.


		// Afficher le nom et le nombre de points de vente des villes qui ont au
		// moins 20 points de vente
	}


	private static Reader ouvrir(String nomFichier)
			throws FileNotFoundException, IOException
	{
		if (nomFichier.endsWith(".zip")) {
			// On suppose que l'archive est bien formée :
			// elle contient fichier XML !
			ZipFile zfile = new ZipFile(nomFichier);
			ZipEntry premiere = zfile.entries().nextElement();
			return new InputStreamReader(zfile.getInputStream(premiere));
		} else {
			return new FileReader(nomFichier);
		}
	}


	public static void main(String[] args) throws FileNotFoundException {
		if (args.length != 1) {
			System.out.println("usage : java Main <fichier.xml>");
		} else {
			try (Reader in = ouvrir(args[0])) {
				repondreQuestions(in);
			} catch (FileNotFoundException e) {
				System.out.println("Fichier non trouvé : " + args[0]);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}

}
