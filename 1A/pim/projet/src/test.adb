with Registre;
with Liste_Chainee;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Calendar; use Calendar;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Test is

    package Registre_20 is
            new Registre(20);
    use Registre_20;

    package Liste_Entier is
            new Liste_Chainee(Integer);
    use Liste_Entier;



    procedure Aff_Elmt(x: in Integer) is
    begin
        Put(x);
        Put(", ");
    end Aff_Elmt;

    procedure Afficher_Liste is new Liste_Entier.Appliquer_Sur_Tous(Aff_Elmt);

    procedure Aff_Elmt_Donnee(x: in T_Donnee) is
    begin
        Put_Line(Integer'Image(x.Id) & ", " & To_String(x.Prenom) & ", " & To_String(x.Nom));
    end Aff_Elmt_Donnee;

    procedure Afficher_Liste_Donnee is new Registre_20.Liste_Donnee.Appliquer_Sur_Tous(Aff_Elmt_Donnee);

    Reg: T_Registre;
    P1: T_Donnee;
    P2: T_Donnee;
    P3: T_Donnee;
    Liste_H: Registre_20.Liste_Donnee.T_Liste;
begin
    --Initialisation
    Put_Line("---Initialisation---");
    Initialiser_Registre(Reg);

    P1 := T_Donnee'(1,Ada.Strings.Unbounded.To_Unbounded_String("Personne1"),To_Unbounded_String("Nom1"),Time_Of(2018,7,27,0.0),Homme);
    P2 := T_Donnee'(2, To_Unbounded_String("Personne2"), To_Unbounded_String("Nom2"), Time_Of(1960,4,14,0.0),Homme);
    P3 := T_Donnee'(3, To_Unbounded_String("Personne1"), To_Unbounded_String("Nom1"), Time_Of(1901,8,4,0.0),Femme);


    Put_Line("---Ajout de P1,P2,P3---");
    Ajouter_Registre(Reg, P1);--Ajout
    Ajouter_Registre(Reg, P2);
    Ajouter_Registre(Reg, P3);

    Put_Line("Est_present P1: " & Boolean'Image(Est_Present_Registre(Reg, 1)));
    Put_Line("Prenom P1: " & To_String(Obtenir_Donnee(Reg,1).Prenom));

    --Modifier_Registre(Reg, P1, P2);

    Liste_Donnee.Initialiser_Liste(Liste_H);
    Homonymes(Reg, To_Unbounded_String("Personne1"), To_Unbounded_String("Nom1"), Liste_H);
    Afficher_Liste_Donnee(Liste_H);

    Put_Line("Taille Liste_H: " & Integer'Image(Liste_Donnee.Taille_Liste(Liste_H)));

    Put_Line("---Supprimer P1---");
    Supprimer_Registre(Reg, 1);

    Detruire_Registre(Reg);

end Test;
