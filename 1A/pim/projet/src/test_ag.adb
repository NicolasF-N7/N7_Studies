--with Registre;
--with Liste_Chainee;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Calendar; use Calendar;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Arbre_Genealogique; use Arbre_Genealogique;


procedure test_ag is
    
    procedure Aff_Elmt(x: in Integer) is
    begin
        Put(x);
        Put(", ");
    end Aff_Elmt;

    procedure Afficher_Liste_Entier is new Arbre_Genealogique.Liste_Entier.Appliquer_Sur_Tous(Aff_Elmt);
    
    AG: T_Arbre_Genealogique;
    
    Liste :Arbre_Genealogique.Liste_Entier.T_Liste;
begin
    Put_Line("Initialisation...");
    Initialiser_Arbre_Genealogique(AG, 1);
    Afficher_AG(AG);
    Put_Line("Ajout des noeuds 2, 3, 4, 5, 6:");
    Ajouter_Arbre_Genealogique(AG, 1, 2);
    Ajouter_Arbre_Genealogique(AG, 1, 3);
    Ajouter_Arbre_Genealogique(AG, 2, 4);
    Ajouter_Arbre_Genealogique(AG, 4, 5);
    Ajouter_Arbre_Genealogique(AG, 3, 6);
    --Structure de l'arbre: 
    -- 1-2-4-5
    --  \_3-6
    Afficher_AG(AG);
    
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
    Arbre_Genealogique.Liste_Entier.Initialiser_Liste(Liste);
    Liste := Ancetres(AG, 1);
    Afficher_Liste_Entier(Liste);
    New_Line;
    
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
