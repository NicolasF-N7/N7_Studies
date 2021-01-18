with Ensembles_Tableau;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Ensembles_Sujet_Tableau is


	-- Instancier le paquetage Ensembles_Tableau pour avoir un Ensemble
	-- d'entiers de capacité 10


    package T_Ensemble_Integer is
            new Ensembles_Tableau(10, Integer);
    use T_Ensemble_Integer;

	-- Définir une opération Afficher qui affiche les éléments d'un ensemble
	-- d'entier en s'appuyant sur Appliquer_Sur_Tous.  L'ensemble {5, 28, 10}
	-- sera affiché :
	--           5         28         10

    procedure Affiche_Elemt(X: in Integer) is
    begin
        Put(X);
    end Affiche_Elemt;


    procedure Afficher is new T_Ensemble_Integer.Appliquer_Sur_Tous(Affiche_Elemt);
    --procedure Afficher is new T_Ensemble_Integer.Appliquer_Sur_Tous(Action => Put);
    Ens1 : T_Ensemble;

begin
    Initialiser(Ens1);
    -- Créer un ensemble vide Ens1
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    Put_Line(Boolean'Image(Contient(2, Ens1)));
    Supprimer(10, Ens1);
    Supprimer(10, Ens1);
    Supprimer(10, Ens1);


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    -- Ajouter 5 dans Ens1
    Ajouter(5, Ens1);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    -- Ajouter 28 puis 10 dans Ens1
    Ajouter(28, Ens1);
    Ajouter(10, Ens1);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    -- Ajouter 7 dans Ens1
    Ajouter(7, Ens1);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    -- Supprimer 10 en Ens1
    Supprimer(10, Ens1);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    -- Supprimer 7 en Ens1
    Supprimer(7, Ens1);


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    --Supprimer 5 en Ens1
    Supprimer(7, Ens1);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;


    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Put_Line("Est_vide: " & Boolean'Image(Est_vide(Ens1)));
    Put_Line("Taille: " & Integer'Image(Taille(Ens1)));
    Put_Line("Presence 2: " & Boolean'Image(Contient(2, Ens1)) & ", 5: " & Boolean'Image(Contient(5, Ens1)) & ", 7: " & Boolean'Image(Contient(7, Ens1)) & ", 10: " & Boolean'Image(Contient(10, Ens1)));
    -- Détruire l'ensemble
    Initialiser(Ens1);

end Test_Ensembles_Sujet_Tableau;
