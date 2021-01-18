with Ensembles_Tableau;
with Alea;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Alea;

procedure Nombre_Moyen_Tirage_Tableau is

    package T_Ensemble_Integer is
            new Ensembles_Tableau(100, Integer);
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

    package Mon_Alea is
            new Alea (1, 100);
    use Mon_Alea;


    Ens : T_Ensemble;
    N: Integer;
    Count: Integer;
begin
    Count := 0;
    Initialiser(Ens);
    while Taille(Ens) /=100 loop
        Get_Random_Number(N);
        Ajouter(N, Ens);
        Count := Count +1;
    end loop;

    Put(Count);

end Nombre_Moyen_Tirage_Tableau;

