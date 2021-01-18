with Ada.Text_IO;
use Ada.Text_IO;

-- Dans ce programme, les commentaires de spécification
-- ont **volontairement** été omis !

procedure Comprendre_Mode_Parametre is

    function Double (N : in Integer) return Integer is
    begin
        return 2 * N;
    end Double;

    procedure Incrementer (N : in out Integer) is
    begin
        N := N + 1;
    end Incrementer;

    procedure Mettre_A_Zero (N : out Integer) is
    begin
        N := 0;
    end Mettre_A_Zero;

    procedure Comprendre_Les_Contraintes_Sur_L_Appelant is
        A, B, R : Integer;
    begin
        A := 5;
        -- Indiquer pour chacune des instructions suivantes si elles sont
        -- acceptées par le compilateur.
        R := Double (A);--o
        R := Double (10);--o
        R := Double (10 * A);--o
        R := Double (B);--o B non initialisé sans importance

        Incrementer (A);--o
        Incrementer (10);--n
        Incrementer (10 * A);--n
        Incrementer (B);--o

        Mettre_A_Zero (A);--o
        Mettre_A_Zero (10);--n
        Mettre_A_Zero (10 * A);--n
        Mettre_A_Zero (B);--o
    end Comprendre_Les_Contraintes_Sur_L_Appelant;


    procedure Comprendre_Les_Contrainte_Dans_Le_Corps (
            A      : in Integer;
            B1, B2 : in out Integer;
            C1, C2 : out Integer)--params
    is
        L: Integer;--Variable
    begin
        -- pour chaque affectation suivante indiquer si elle est autorisée
        L := A;--o
        A := 1;--n

        B1 := 5;--o car out

        L := B2;--o car L Variable, pas cte
        B2 := B2 + 1;

        C1 := L;--o

        L := C2;--n

        C2 := A;--o
        C2 := C2 + 1;--n
    end Comprendre_Les_Contrainte_Dans_Le_Corps;


begin
    Comprendre_Les_Contraintes_Sur_L_Appelant;
    Put_Line ("Fin");
end Comprendre_Mode_Parametre;
