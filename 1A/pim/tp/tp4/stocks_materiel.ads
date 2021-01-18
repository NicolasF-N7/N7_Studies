
-- Auteur: 
-- Gérer un stock de matériel informatique.

package Stocks_Materiel is


    CAPACITE : constant Integer := 10;      -- nombre maximum de matériels dans un stock

    type T_Nature is (UNITE_CENTRALE, DISQUE, ECRAN, CLAVIER, IMPRIMANTE);

    type T_Materiel is private;
    
    type T_TabMateriel is private;
    
    type T_Stock is limited private;


    -- Créer un stock vide.
    --
    -- paramètres
    --     Stock : le stock à créer
    --
    -- Assure
    --     Nb_Materiels (Stock) = 0
    --
    procedure Creer (Stock : out T_Stock) with
        Post => Nb_Materiels (Stock) = 0;


    -- Obtenir le nombre de matériels dans le stock Stock
    --
    -- Paramètres
    --    Stock : le stock dont ont veut obtenir la taille
    --
    -- Nécessite
    --     Vrai
    --
    -- Assure
    --     Résultat >= 0 Et Résultat <= CAPACITE
    --
    function Nb_Materiels (Stock: in T_Stock) return Integer with
        Post => Nb_Materiels'Result >= 0 and Nb_Materiels'Result <= CAPACITE;


    -- Enregistrer un nouveau métériel dans le stock.  Il est en
    -- fonctionnement.  Le stock ne doit pas être plein.
    -- 
    -- Paramètres
    --    Stock : le stock à compléter
    --    Numero_Serie : le numéro de série du nouveau matériel
    --    Nature       : la nature du nouveau matériel
    --    Annee_Achat  : l'année d'achat du nouveau matériel
    -- 
    -- Nécessite
    --    Nb_Materiels (Stock) < CAPACITE
    -- 
    -- Assure
    --    Nouveau matériel ajouté
    --    Nb_Materiels (Stock) = Nb_Materiels (Stock)'Avant + 1
    procedure Enregistrer (
            Stock        : in out T_Stock;
            Numero_Serie : in     Integer;
            Nature       : in     T_Nature;
            Annee_Achat  : in     Integer
        ) with
            Pre => Nb_Materiels (Stock) < CAPACITE,
            Post => Nb_Materiels (Stock) = Nb_Materiels (Stock)'Old + 1;
    
    --Donne le nombre d'elements hors services
    --
    --Necessite: Vrai
    --
    --Assure: 0 <= Resultat <= Capacite
    function Nb_Materiels_Hors_Etat (Stock : in T_Stock) return Integer;
    
    --Changer l'etat d'un matériel dans le stock
    --
    --Necessite: Vrai
    --
    --Assure: i tel que Stock.TabMat(i).Num_Serie , Stock.TabMat(i).Etat = Etat
    procedure Actu_Etat_Elemt(Stock: out T_Stock; ID: in Integer; Etat: in Boolean);

private
    type T_Materiel is
        record
            Num_Serie: Integer;
            Nature: T_Nature;
            Annee_Achat: Integer;
            Etat: Boolean;-- True -> Fonctionne ; False -> non fonctionnel
        end record;
    
    type T_TabMateriel is array (1..CAPACITE) of T_Materiel;
    
        
    type T_Stock is
        record
            TabMat: T_TabMateriel;
            NbElmt: Integer;
        end record;
        
end Stocks_Materiel;
