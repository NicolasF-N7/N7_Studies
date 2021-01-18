with Ensembles_Chainage;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Ensembles_Sujet_Tableau is


    -- Instancier le paquetage Ensembles_Tableau pour avoir un Ensemble
    -- d'entiers de capacité 10
    package T_Ensemble_Integer is
            new Ensembles_Chainage(Integer);
    use T_Ensemble_Integer;


	-- Définir une opération Afficher qui affiche les éléments d'un ensemble
	-- d'entier en s'appuyant sur Appliquer_Sur_Tous.  L'ensemble {5, 28, 10}
	-- sera affiché :
	--           5         28         10
    procedure Affiche_Elemt(X: in Integer) is
    begin
        Put(X);
        New_Line;
    end Affiche_Elemt;


    procedure Afficher is new T_Ensemble_Integer.Appliquer_Sur_Tous(Affiche_Elemt);
    --procedure Afficher is new T_Ensemble_Integer.Appliquer_Sur_Tous(Action => Put);

    Ens1 : T_Ensemble;

begin
    pragma assert(False);
	-- Créer un ensemble vide Ens1
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Ajouter 5 dans Ens1
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Ajouter 28 puis 10 dans Ens1
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Ajouter 7 dans Ens1
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Supprimer 10 en Ens1
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Supprimer 7 en Ens1
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Supprimer 5 en Ens1
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10

	-- Détruire l'ensemble

end Test_Ensembles_Sujet_Tableau;
