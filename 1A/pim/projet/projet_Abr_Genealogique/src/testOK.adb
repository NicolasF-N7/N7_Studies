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

    procedure Afficher_Liste is new Appliquer_Sur_Tous(Aff_Elmt);

    Reg: T_Registre;
    P1: T_Donnee;
    P2: T_Donnee;
    P3: T_Donnee;
begin
    --Initialisation
    Put_Line("---Initialisation---");
    Initialiser_Registre(Reg);

    P1 := T_Donnee'(1,Ada.Strings.Unbounded.To_Unbounded_String("Personne1"),To_Unbounded_String("Nom1"),Time_Of(2018,7,27,0.0),Homme);
    P2 := T_Donnee'(2, To_Unbounded_String("Personne2"), To_Unbounded_String("Nom2"), Time_Of(1960,4,14,0.0),Homme);
    P3 := T_Donnee'(3, To_Unbounded_String("Personne3"), To_Unbounded_String("Nom3"), Time_Of(1901,8,4,0.0),Femme);

    --Est vide
    Put_Line("Est_Vide: " & Boolean'Image(Est_Registre_Vide(Reg)));

    --Ajout
    Put_Line("---Ajout de P1---");
    Ajouter_Registre(Reg, P1);

    Put_Line("Est_Present P1: " & Boolean'Image(Est_Present_Registre(Reg, P1)));
    Put_Line("Est_Present P2: " & Boolean'Image(Est_Present_Registre(Reg, P2)));
    Put_Line("Est_Present P3: " & Boolean'Image(Est_Present_Registre(Reg, P3)));

    Put_Line("---Ajout de P2---");
    Ajouter_Registre(Reg, P2);
    Put_Line("---Ajout de P3---");
    Ajouter_Registre(Reg, P3);

    Put_Line("Est_Present P1: " & Boolean'Image(Est_Present_Registre(Reg, P1)));
    Put_Line("Est_Present P2: " & Boolean'Image(Est_Present_Registre(Reg, P2)));
    Put_Line("Est_Present P3: " & Boolean'Image(Est_Present_Registre(Reg, P3)));

    Put_Line("---Homonymes Personne1, Nom1---");
    --Afficher_Liste(Homonymes(Reg, "Nom1", "Prenom1"));

    Put_Line("Obtenir donnee 2(prenom) " & To_String(Obtenir_Donnee(Reg, 2).Prenom));

    Put_Line("---Modifier P2---");
    P2 := T_Donnee'(2, To_Unbounded_String("Personne2Nouvelle"), To_Unbounded_String("Nom2Nv"), Time_Of(1960,4,24,0.0),Homme);
    Modifier_Registre(Reg, 2, P2);

    Put_Line("Obtenir donnee 2(prenom) " & To_String(Obtenir_Donnee(Reg, 2).Prenom));

    Put_Line("Taille Registre: "& Integer'Image(Taille_Registre(Reg)));

    Put_Line("---Supprimer P1---");
    Supprimer_Registre(Reg, 1);
    Detruire_Registre(Reg);

end Test;
