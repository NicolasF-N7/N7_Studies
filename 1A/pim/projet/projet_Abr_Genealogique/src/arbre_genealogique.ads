--Specification du module Arbre_Genealogique. Il utilise les modules Arbre_Binaire (pour avoir la structure d'un arbre) et Registre (pour pouvoir insérer dans 
--chaque noeud de l'arbre une donnée, elle-même répertoriée dans le registre.
-- Difference entre binaire et genealogique : g cle unique, inserer not present - 
with Ada.Text_IO;use  Ada.Text_IO;
with Calendar; use Calendar;
with Arbre_Binaire; 
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Liste_Chainee;
with Registre;

--On assure qu'un individu existe dans le registre SSI il existe dans l'arbre.
package Arbre_Genealogique is
    
    package Liste_Entier is 
            new liste_chainee (Integer);
    use Liste_Entier;
    
    --Instenciation de arbre binaire par des entiers
    package Arbre_Binaire_Entier is
            new Arbre_Binaire(T_Element => Integer);
    use Arbre_Binaire_Entier;
    
    type T_Arbre_Genealogique is limited private;
    
    type T_Parents is record
        Pere: Integer;--a gauche
        Mere: Integer;--a droite
    end record;
    
    Node_Not_Found: Exception;
    
    --Savoir si un arbre généalogique est reduit a la racine.
    function Est_Vide_AG(Arbre : in T_Arbre_Genealogique) return boolean;

    --Initialise un arbre minimal contenant le seul noeud racine, sans père ni mère.
    procedure Initialiser_Arbre_Genealogique(Arbre: out T_Arbre_Genealogique; Racine : in Integer) with
            Pre => True,
            Post => True;
    
    --Renvoie true si le noeud IDNoeud est dans l'AG
    function Est_Present_Arbre_Genealogique(Arbre: in T_Arbre_Genealogique; Id_Noeud : in Integer) return Boolean;
    
    --Ajouter un noeud dans un arbre genealogique tel que Prenom ait pour fils Prenom_Fils
    -- mettre une condition sur la difference d'age minimum entre le parent et le fils.
    --ATTENTION: verifier au préalable que l'ID Id_Fils est dans le registre
    procedure Ajouter_Arbre_Genealogique(Arbre: in out T_Arbre_Genealogique; Id_Fils : in Integer ; Id_Parent: in Integer) with
            Pre => Est_Present_Arbre_Genealogique(Arbre, Id_Fils),
            Post => Est_Present_Arbre_Genealogique(Arbre, Id_Parent);
    
    function Taille_AG(Arbre: in T_Arbre_Genealogique) return Integer;
    
    -- Connaitre le nombre d'ancetres connus d'un individu.(L'individus n'est pas inclus dans ses ancetres)
    function Nombre_Ancetres (Arbre : in T_Arbre_Genealogique; Id_Noeud : in Integer) return Integer;
    
    --Renvoie le nombre de parents. Compris entre 0 et 2
    --renvoie 0 si Id_Noeud n'est pas dans l'arbre
    function Nombre_Parents(Arbre: in T_Arbre_Genealogique; Id_Noeud : in Integer) return Integer with
            Pre => True,
            Post => True;
    
    --Obtenir l'ensemble des individus qui n'ont qu'un parent connu.
    function Un_Parent (Arbre: in T_Arbre_Genealogique) return T_Liste;
    
    --Obtenir l'ensemble des individus dont les deux parents sont connus.
    function Deux_Parents (Arbre : in T_Arbre_Genealogique) return T_Liste;
    
    --Obtenir l'ensemble des individus dont les deux parents sont inconnus.
    function Inconnus (Arbre : in T_Arbre_Genealogique) return T_Liste;
    
    
    --Renvoie l'identifiant du fil de Noeud, retourne -1 si noeud non trouve
    function Fils(Arbre: in T_Arbre_Genealogique; Id_Noeud : in Integer) return Integer with
            Pre => True,
            Post => True;
    
    --Renvoie les identifiants des parents du noeud
    --Si noeud n'est pas present alors renvoie les identifiants(-1,-1)
    function Get_Parents(Arbre: in T_Arbre_Genealogique; Noeud : in Integer) return T_Parents with
            Pre => True,
            Post => True;
    
    
    --Supprime le noeud associe a Prenom, et tout ses ancetres.
    procedure Supprimer_Arbre_Genealogique(Arbre: in out T_Arbre_Genealogique; Noeud : in Integer) with
            Pre => True,
            Post => True;
    
    --renvoie une liste constitué des ancetres du noeud, le noeud y compris
    function Ancetres(Arbre: in T_Arbre_Genealogique; Noeud: in Integer) return Liste_Entier.T_Liste;
    
    --Renvoie la liste des ancetres de noeud situé à la generation exactement N
    function Ancetres_Generation(Arbre: in T_Arbre_Genealogique; Noeud: in Integer; N: Integer) return Liste_Entier.T_Liste;
    
    --Renvoie la liste des ancetres de noeuds de génération plus petite que N
    function Ancetres_Generation_Plus_Petite(Arbre: in T_Arbre_Genealogique; Noeud: in Integer; N: Integer) return Liste_Entier.T_Liste;
        
    --Affiche dans la console l'arbre genealogique
    procedure Afficher_AG(Arbre: in T_Arbre_Genealogique);
    
    function Get_Sous_AG_Gauche(Arbre: in T_Arbre_Genealogique) return T_Arbre_Genealogique;
    
    function Get_Sous_AG_Droit(Arbre: in T_Arbre_Genealogique) return T_Arbre_Genealogique;
    
    function Get_Racine(Arbre: in T_Arbre_Genealogique) return Integer;
    
    --Detruire: liberer l'espace memoire occupé par l'arbre
    procedure Detruire_Arbre_Genealogique(Arbre: in out T_Arbre_Genealogique) with
            Pre => True,
            Post => True;--Arbre = Null;
    

private
    type T_Arbre_Genealogique is new Arbre_Binaire_Entier.T_AB;
       --Type T_Arbre_Genealogique is
         --   record
         --       Arbre : T_AB;
        --        Registre : T_Registre;
       --     end record;
    
end Arbre_Genealogique;
