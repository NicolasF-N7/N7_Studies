-- Implantation du module Arbre_Binaire.
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body Arbre_Binaire is

   procedure Free is
            new Ada.Unchecked_Deallocation (Object => T_Noeud, Name => T_AB);

    procedure Initialiser_AB(Arbre : out T_AB; Donnee : in T_Element) is
    begin
        --Arbre.all.Donnee := Donnee;
        Arbre := new T_Noeud'(Donnee, Null,Null);
    end Initialiser_AB;

    function Est_Vide_AB(Arbre : in T_AB) return boolean is
    begin
        return Arbre = Null;
    end Est_Vide_AB;

    procedure Ajouter_AB(Arbre : in out T_AB; Pere : in T_Element; Fils : in T_Element) is
    begin
        if Arbre = Null then
            null;
        elsif Arbre.all.Donnee = Pere then
            if Arbre.all.Sous_Arbre_Gauche = Null then
                Arbre.all.Sous_Arbre_Gauche := new T_Noeud'(Fils, null, null);
            elsif Arbre.Sous_Arbre_Droit = Null then
                Arbre.all.Sous_Arbre_Droit := new T_Noeud'(Fils, null, null);
            else
                raise Parents_Already_Defined_Exception;
            end if;
        else
            Ajouter_AB(Arbre.all.Sous_Arbre_Gauche, Pere, Fils);
            Ajouter_AB(Arbre.all.Sous_Arbre_Droit, Pere, Fils);
        end if;


        --if Est_Vide_AB(Arbre) then
        --    Arbre := new T_Noeud'(Fils, null, null);
        --elsif Est_Vide_AB(Arbre.all.Sous_Arbre_Gauche) then
        --    Ajouter_AB(Arbre.all.Sous_Arbre_Gauche,Pere,Fils);
       -- else
        --    Ajouter_AB(Arbre.all.Sous_Arbre_Droit,Pere,Fils);
        --end if;
    end Ajouter_AB;

    function Est_Present_AB(Arbre : in T_AB; Donnee : in T_Element) return boolean is
    begin
        if Est_Vide_AB(Arbre) then
            return False;
        elsif Arbre.all.Donnee = Donnee then
            return True;
        else
            return Est_Present_AB(Arbre.all.Sous_Arbre_Gauche, Donnee) or Est_Present_AB(Arbre.all.Sous_Arbre_Droit,Donnee);
        end if;
    end Est_Present_AB;


    function Taille_AB(Arbre:in T_AB) return integer is
    begin
        if Arbre = Null then
            return 0;
        else
            return Taille_AB(Arbre.all.Sous_Arbre_Gauche)+Taille_Ab(Arbre.all.Sous_Arbre_Droit)+1;
        end if;
    end Taille_AB;

    function Nombre_Fils(Arbre : in T_AB) return Integer is
    begin
        if Arbre.Sous_Arbre_Gauche = null and Arbre.Sous_Arbre_Droit = Null then
            return 0;
        elsif Arbre.Sous_Arbre_Gauche /= null and Arbre.Sous_Arbre_Droit /= null then
            return 2;
        else
            return 1;
        end if;
    end Nombre_Fils;


    function Get_sous_arbre_gauche(Arbre : in T_AB) return T_AB is
    begin
        return Arbre.Sous_Arbre_Gauche;
    end Get_sous_arbre_gauche;


    function Get_sous_arbre_droit(Arbre : in T_AB) return T_AB is
    begin
        return Arbre.Sous_Arbre_Droit;
    end Get_sous_arbre_droit;


    function Get_donnee(Arbre : in T_AB) return T_Element is
    begin
        return Arbre.Donnee;
    end Get_donnee;


    procedure Supprimer_AB(Arbre : in out T_AB; Donnee : in T_Element) is
    begin
        if Arbre = Null then
            null;
        elsif Arbre.all.donnee = donnee then
            Detruire_AB(Arbre);
        else
            Supprimer_AB(Arbre.all.Sous_Arbre_Gauche, Donnee);
            Supprimer_AB(Arbre.all.Sous_Arbre_Droit,Donnee);
        end if;
    end Supprimer_AB;

    procedure Detruire_AB(Arbre : in out T_AB) is
    begin
        if Est_Vide_AB(Arbre) then
            Null;
        else
            Detruire_AB(Arbre.all.Sous_Arbre_Gauche);
            Detruire_AB(Arbre.all.Sous_Arbre_Droit);
            free(Arbre);
        end if;
    end Detruire_AB;

end Arbre_Binaire;
