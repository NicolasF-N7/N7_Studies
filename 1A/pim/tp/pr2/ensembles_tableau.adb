with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Ensembles_Tableau is

    --Initialise un nvx ensemble à l'ensemble vide
    --
    --Necessite: Vrai
    --
    --Assure: Ens est vide
    procedure Initialiser(Ens: out T_Ensemble) is
    begin
        Ens.Nb_Elmts := 0;
    end Initialiser;


    --Test si un ensemble est vide: renvoie true si Ens est vide, false sinon
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Est_vide(Ens: in T_Ensemble) return Boolean is
    begin
        return Ens.Nb_Elmts = 0;
    end Est_vide;


    --Donne la taille d'un ensemble
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Taille(Ens: in T_Ensemble) return Integer is
    begin
        return Ens.Nb_Elmts;
    end Taille;


    --Test si l'element x est present dans Ens: retourne true si tel est le cas, false sinon
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Contient(x: in T_Element; Ens: in T_Ensemble) return Boolean is
        Result : Boolean;
    begin
        Result := False;

        for I in 1..Taille(Ens) loop
            if Ens.Elmt(I) = x then
                Result := True;
            else
                null;
            end if;
        end loop;
        return Result;
    end Contient;


    --Ajoute x à Ens
    --
    --Necessite: Taille(Ens) < Capacite
    --
    --Assure: Ens contient x
    procedure Ajouter(x: in T_Element; Ens: in out T_Ensemble) is
    begin
        if not(Contient(x, Ens)) then
            Ens.Elmt(Taille(Ens)+1) := x;
            Ens.Nb_Elmts := Ens.Nb_Elmts+1;
        else
            null;
        end if;
    end Ajouter;


    --Supprime x à Ens
    --
    --Necessite: x appartient à Ens
    --
    --Assure: Ens ne contient pas x
    procedure Supprimer(x: in T_Element; Ens: in out T_Ensemble) is -- PRECONDITION NE MMMMMMMMMMMMMMMMMMMMMMMMARCHE PAS
        IndX: Integer; -- Indice où se situe x dans le tableau
    begin
        pragma Assert(False);--NE MARCHE PAS ???

        if Contient(x, Ens) then
            IndX := 0;

            for I in 1..Taille(Ens) loop
                if Ens.Elmt(I) = x then
                    IndX := I;
                else
                    null;
                end if;
            end loop;

            --Décaler tout les elements à la droite de x
            for I in IndX..(Taille(Ens)-1) loop
                Ens.Elmt(I) := Ens.Elmt(I+1);
            end loop;

            Ens.Nb_Elmts := Ens.Nb_Elmts -1;
        end if;

    end Supprimer;


    --Effectue Action pour tout les elments de Ens
    --
    --Necessite: vrai
    --
    --Assure: vrai
    procedure Appliquer_Sur_Tous(Ens: in T_Ensemble) is
    begin
        for I in 1..Taille(Ens) loop
            Action(Ens.Elmt(I));
        end loop;

    end Appliquer_Sur_Tous;



end Ensembles_Tableau;
