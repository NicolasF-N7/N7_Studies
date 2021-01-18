with Ensembles_Chainage;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
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
    Initialiser(Ens1);
    Ajouter(5, Ens1);
    Ajouter(19, Ens1);
    Ajouter(55, Ens1);
    Ajouter(42, Ens1);
    Put_Line(Integer'Image(Taille(Ens1)));
    Afficher(Ens1);

    Supprimer(5,Ens1);
    Supprimer(42,Ens1);
    Supprimer(19,Ens1);
    Supprimer(55,Ens1);
    --pragma assert(False);
    Put_Line("END");
    Afficher(Ens1);

    --Detruire(Ens1);

end Main;
