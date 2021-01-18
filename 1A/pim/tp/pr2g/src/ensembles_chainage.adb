with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body Ensembles_Chainage is

    procedure Free is
            new Ada.Unchecked_Deallocation (T_Cellule, T_Ensemble);


    procedure Initialiser(E: out T_Ensemble) is
    begin
        E := Null;
    end Initialiser;


    procedure Detruire(E: out T_Ensemble) is
    begin
        if E = Null then
            Null;
        else
            Detruire(E.all.Suivant);
            Free(E);
        end if;
    end Detruire;


    function Est_Vide(E:in T_Ensemble) return Boolean is
    begin
        return E = Null;
    end Est_Vide;


    function Taille(E: in T_Ensemble) return Integer is
    begin
        if E = Null then
            return 0;
        else
            return 1+Taille(E.all.Suivant);
        end if;
    end Taille;

    function Contient(x: in T_Element; E: in T_Ensemble) return Boolean is
    begin
        if E = Null then
            return False;
        elsif E.all.Element = x then
            return True;
        else
            return Contient(x, E.all.Suivant);
        end if;
    end Contient;

    procedure Ajouter(x: in T_Element; E: in out T_Ensemble) is
    begin
        if not Contient(x, E) then
            E := New T_Cellule'(x, E);
        else
            Null;
        end if;
    end Ajouter;

    procedure Supprimer(x: in T_Element; E: in out T_Ensemble) is
        Temp: T_Ensemble;
    begin
        if E = Null then
            Null;
        else
            if E.all.Element = x then
                Temp := E;
                E := E.all.Suivant;
                Free(Temp);
            else
                Supprimer(x, E.all.Suivant);
            end if;
        end if;
    end Supprimer;

    procedure Appliquer_Sur_Tous(E: in T_Ensemble) is
    begin
        if E /= Null then
            Action(E.all.Element);
            Appliquer_Sur_Tous(E.all.Suivant);
        else
            Null;
        end if;
    end Appliquer_Sur_Tous;





end Ensembles_Chainage;
