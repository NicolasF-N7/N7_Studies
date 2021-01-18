with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Auteur: 
-- Gérer un stock de matériel informatique.
--
package body Stocks_Materiel is

    procedure Creer (Stock : out T_Stock) is
    begin
        Stock.NbElmt := 0;
    end Creer;


    function Nb_Materiels (Stock: in T_Stock) return Integer is
    begin
        return Stock.NbElmt;
    end;


    procedure Enregistrer (
            Stock        : in out T_Stock;
            Numero_Serie : in     Integer;
            Nature       : in     T_Nature;
            Annee_Achat  : in     Integer
                          ) is
        Mat: T_Materiel;
    begin
        Mat.Num_Serie := Numero_Serie;
        Mat.Nature := Nature;
        Mat.Annee_Achat := Annee_Achat;
        Mat.Etat := True;
        
        Stock.NbElmt := Stock.NbElmt+1;
        Stock.TabMat(Stock.NbElmt) := Mat;
    end;
    
    function Nb_Materiels_Hors_Etat (Stock : in T_Stock) return Integer is
        Count: Integer;
    begin
        Count := 0;
        for i in 1..(Stock.NbElmt) loop
            if Stock.TabMat(i).Etat = False then
                Count := Count+1;
            end if;
        end loop;
        return Count;
    end;
    
    procedure Actu_Etat_Elemt(Stock: out T_Stock; ID: in Integer; Etat: in Boolean) is
        IndiceElmt: Integer;
    begin
        for i in 1..(Stock.NbElmt) loop
            if Stock.TabMat(i).Num_Serie = ID then
                IndiceElmt := i;
            end if;
        end loop;
        Stock.TabMat(i).Etat := Etat;
        
    end;
    
    


end Stocks_Materiel;
