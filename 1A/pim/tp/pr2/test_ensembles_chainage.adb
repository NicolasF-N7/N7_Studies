with Ensembles_Chainage;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Ensembles_Chainage is
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
    E : T_Ensemble;
begin
    Initialiser(E);
    Put_Line("Est_Vide: " & Boolean'Image(Est_Vide(E)));
    --Test ajouter:
    Ajouter(2,E);
    Ajouter(3,E);
    Ajouter(5,E);
    Ajouter(7,E);
    Ajouter(11,E);

    Afficher(E); --Test Appliquer sur tous
    Put_Line("Est_Vide: " & Boolean'Image(Est_Vide(E)));--Test Est_Vide

    -- Test supprimer
    Put_Line("Suppression de 7");
    Supprimer(7, E);-- Test cas suppression element en milieu de liste
    Afficher(E);

    Put_Line("Suppression de 2");
    Supprimer(2, E);--Test cas limite: en fin de liste
    Afficher(E);

    Put_Line("Suppression de 11");
    Supprimer(11, E);--Test cas limite: en tete de liste
    Afficher(E);

    --Test contient
    Put_Line("Contient 11: " & Boolean'Image(Contient(11, E)));

    Put_Line("Contient 5: " & Boolean'Image(Contient(5, E)));

    Detruire(E);

end Test_Ensembles_Chainage;
