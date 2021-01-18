--with Registre;
--with Liste_Chainee;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Calendar; use Calendar;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Arbre_Genealogique; use Arbre_Genealogique;
with Registre;


procedure test_ag is
    
    procedure Aff_Elmt(x: in Integer) is
    begin
        Put(x);
        Put(", ");
    end Aff_Elmt;

    procedure Afficher_Liste_Entier is new Arbre_Genealogique.Liste_Entier.Appliquer_Sur_Tous(Aff_Elmt);
    
    package Registre_20 is
            new Registre(20);
    use Registre_20;
    
    
    procedure Afficher_Ag_convivialement(Arbre: in Arbre_Genealogique.T_Arbre_Genealogique; Reg: in Registre_20.T_Registre; Indentation: Integer) is
        Noeud_Donnee : T_Donnee;
        jour: Integer;
        mois: Integer;
        annee: Integer;
        sec: Standard.Duration;
    begin
        --   mere
        --fils
        --   pere
        if Est_Vide_AG(Arbre) then
            null;
        end if;
        
        Noeud_Donnee := Obtenir_Donnee(Reg, Get_Racine(Arbre));--donnee associee a la racine de l'arbre
        Split(Noeud_Donnee.Date_Naissance, annee, mois, jour, sec);
        
        --Affichage du sous arbre gauche
        if not Est_Vide_AG(Get_Sous_AG_Gauche(Arbre)) then            
            Afficher_Ag_convivialement(Get_Sous_AG_Gauche(Arbre), Reg, Indentation+1);
            New_Line;
        end if;
        
        --Indentation
        for i in 1..(Indentation-1) loop
                Put("        ");
        end loop;
        if Indentation > 0 then
            Put("     -> ");
        end if;
        
        --Affichage du noeud
        Put_Line(To_String(Noeud_Donnee.Prenom) & " " & To_String(Noeud_Donnee.Nom) & " " & Integer'Image(jour) & "/" & Integer'Image(mois) & "/" & Integer'Image(annee));
        
        --Affichage du sous arbre droit
        if not Est_Vide_AG(Get_Sous_AG_Droit(Arbre)) then
            New_Line;
            Afficher_Ag_convivialement(Get_Sous_AG_Droit(Arbre), Reg, Indentation+1);
        end if;
    end Afficher_Ag_convivialement;
    
     -- 1-2-4-5
    --  \_3-6
    
    
    AG: T_Arbre_Genealogique;
    Reg: T_Registre;
    
    Liste :Arbre_Genealogique.Liste_Entier.T_Liste;
    
    P1 : T_Donnee;
    P2 : T_Donnee;
    P3 : T_Donnee;
    P4 : T_Donnee;
    P5 : T_Donnee;
    P6 : T_Donnee;
begin
    Initialiser_Registre(Reg);
    P1 := T_Donnee'(1,Ada.Strings.Unbounded.To_Unbounded_String("P1"),To_Unbounded_String("N1"),Time_Of(2018,7,27,0.0),Femme);
    P2 := T_Donnee'(2,Ada.Strings.Unbounded.To_Unbounded_String("P2"),To_Unbounded_String("N2"),Time_Of(2015,6,18,0.0),Homme);
    P3 := T_Donnee'(3,Ada.Strings.Unbounded.To_Unbounded_String("P3"),To_Unbounded_String("N3"),Time_Of(2002,8,2,0.0),Homme);
    P4 := T_Donnee'(4,Ada.Strings.Unbounded.To_Unbounded_String("P4"),To_Unbounded_String("N4"),Time_Of(2019,12,31,0.0),Femme);
    P5 := T_Donnee'(5,Ada.Strings.Unbounded.To_Unbounded_String("P5"),To_Unbounded_String("N5"),Time_Of(2013,3,14,0.0),Homme);
    P6 := T_Donnee'(6,Ada.Strings.Unbounded.To_Unbounded_String("P6"),To_Unbounded_String("N6"),Time_Of(2005,6,29,0.0),Femme);
    
    Ajouter_Registre(Reg, P1);
    Ajouter_Registre(Reg, P2);
    Ajouter_Registre(Reg, P3);
    Ajouter_Registre(Reg, P4);
    Ajouter_Registre(Reg, P5);
    Ajouter_Registre(Reg, P6);
    
    Put_Line("Initialisation...");
    Initialiser_Arbre_Genealogique(AG, 1);
    
    Put_Line("Ajout des noeuds 2, 3, 4, 5, 6:");
    Ajouter_Arbre_Genealogique(AG, 1, 2);
    Ajouter_Arbre_Genealogique(AG, 1, 3);
    Ajouter_Arbre_Genealogique(AG, 2, 4);
    Ajouter_Arbre_Genealogique(AG, 4, 5);
    Ajouter_Arbre_Genealogique(AG, 3, 6);
    --Structure de l'arbre: 
    -- 1-2-4-5
    --  \_3-6
    
    
    Put_Line("Presence des noeuds 1,2,3,4,5,6 dans l'ordre:");
    Put(Boolean'Image(Est_Present_Arbre_Genealogique(AG, 1)));
    Put(Boolean'Image(Est_Present_Arbre_Genealogique(AG, 2)));
    Put(Boolean'Image(Est_Present_Arbre_Genealogique(AG, 3)));
    Put(Boolean'Image(Est_Present_Arbre_Genealogique(AG, 4)));
    Put(Boolean'Image(Est_Present_Arbre_Genealogique(AG, 5)));
    Put_Line(Boolean'Image(Est_Present_Arbre_Genealogique(AG, 6)));
    
    Put_Line("Test Nombre ancetres");
    pragma assert(Nombre_Ancetres(AG, 1) = 5);
    pragma assert(Nombre_Ancetres(AG, 2) = 2);
    pragma assert(Nombre_Ancetres(AG, 3) = 1);
    pragma assert(Nombre_Ancetres(AG, 4) = 1);
    pragma assert(Nombre_Ancetres(AG, 5) = 0);
    pragma assert(Nombre_Ancetres(AG, 6) = 0);
    
    
    Put_Line("Test Nombre parents");
    pragma assert(Nombre_Parents(AG, 1) = 2);
    pragma assert(Nombre_Parents(AG, 2) = 1);
    pragma assert(Nombre_Parents(AG, 3) = 1);
    pragma assert(Nombre_Parents(AG, 4) = 1);
    pragma assert(Nombre_Parents(AG, 5) = 0);
    pragma assert(Nombre_Parents(AG, 6) = 0);
    
    Put_Line("Test Un_Parent, Deux_Parents, Inconnus");
    pragma assert(Arbre_Genealogique.Liste_Entier.Taille_Liste(Un_Parent(AG)) = 3);
    pragma assert(Arbre_Genealogique.Liste_Entier.Taille_Liste(Deux_Parents(AG)) = 1);
    pragma assert(Arbre_Genealogique.Liste_Entier.Taille_Liste(Inconnus(AG)) = 2);
    
    Put_Line("Test Fils");
    pragma assert(Fils(AG, 1) = -1);
    pragma assert(Fils(AG, 2)= 1);
    pragma assert(Fils(AG, 6) = 3);
    
    Put_Line("Test Get_Parents");
    pragma assert(Get_Parents(AG, 1).Pere = 2);
    pragma assert(Get_Parents(AG, 1).Mere = 3);
    
    
    Put_Line("Test Ancetres, Liste ancetres de 1: ");
    Liste := Ancetres(AG, 1);
    Afficher_Liste_Entier(Liste);
    New_Line;
    
    Put_Line("Test Ancetres de generation 2, Liste ancetres de 1 de generation 2: ");
    Liste := Ancetres_Generation(AG, 1, 2);
    Afficher_Liste_Entier(Liste);
    New_Line;
    
    Put_Line("Test Ancetres de generation plus petite que 2, Liste ancetres de 1 de generation <= 2: ");
    Liste := Ancetres_Generation_Plus_Petite(AG, 1, 2);
    Afficher_Liste_Entier(Liste);
    New_Line;
    
    Put_Line("Test AFFICHER AG: ");
    Afficher_Ag_convivialement(AG, Reg,0);
    
    
    
    Put_Line("Test Supprimer_Arbre_Genealogique");
    Supprimer_Arbre_Genealogique(AG, 6);
    Supprimer_Arbre_Genealogique(AG, 5);
    pragma assert(not (Est_Present_Arbre_Genealogique(AG, 5)));
    pragma assert(not (Est_Present_Arbre_Genealogique(AG, 6)));
    Supprimer_Arbre_Genealogique(AG, 2);
    pragma assert(not (Est_Present_Arbre_Genealogique(AG, 2)));
    pragma assert(not (Est_Present_Arbre_Genealogique(AG, 4)));
    Supprimer_Arbre_Genealogique(AG, 1);
    pragma assert(not (Est_Present_Arbre_Genealogique(AG, 1)));
    pragma assert(not (Est_Present_Arbre_Genealogique(AG, 3)));
    
end test_ag;
