with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

-- Objectif : Afficher un tableau trié suivant le principe du tri par sélection.

procedure Tri_Selection is

    CAPACITE: constant Integer := 10;   -- la capacité du tableau

    type Tableau_Entier is array (1..CAPACITE) of Integer;

    type Tableau is
        record
            Elements : Tableau_Entier;
            Taille   : Integer;         --{ Taille in [0..CAPACITE] }
        end record;


    -- Objectif : Afficher le tableau Tab.
    -- Paramètres :
    --     Tab : le tableau à afficher
    -- Nécessite : ---
    -- Assure : Le tableau est affiché.
    procedure Afficher (Tab : in Tableau) is
    begin
        Put ("[");
        if Tab.Taille > 0 then
            -- Afficher le premier élément
            Put (Tab.Elements (1), 1);

            -- Afficher les autres éléments
            for Indice in 2..Tab.Taille loop
                Put (", ");
                Put (Tab.Elements (Indice), 1);
            end loop;
        end if;
        Put ("]");
    end Afficher;

    procedure Permuter (Tab: in out Tableau; i: in Integer; j : in Integer) is
        Tmp: Integer;--Variable temporaire
    begin
        Tmp := Tab.Elements (i);
        Tab.Elements (i) := Tab.Elements (j);
        Tab.Elements (j) := Tmp;
    end Permuter;


    procedure Tri (Tab: in out Tableau) is
        min: Integer;
        indMin: Integer;
    begin
        for k in 1..(Tab.Taille) loop
            min := Tab.Elements(k);
            indMin:= k;
            for i in k..(Tab.Taille) loop--Calcul de la position du minimum
                if Tab.Elements(i) < min then
                    min := Tab.Elements(i);
                    indMin := i;
                end if;
            end loop;

            --On place le min à la bonne position
            Permuter(Tab, k, indMin);
        end loop;
    end Tri;

    function Verif_Tri(Tab: in Tableau; Tab_Trie: in Tableau) is
        Correct: Boolean;
    begin



    end Verif_Tri;



    Tab1 : Tableau;
begin
    -- Initialiser le tableau
    Tab1 := ( (1, 3, 4, 2, others => 0), 4);
    Tri(Tab1);
    -- Afficher le tableau
    Afficher (Tab1);
    New_Line;

end Tri_Selection;
