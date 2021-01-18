generic
    Capacite : Integer;
    type T_Element is private;

package Ensembles_Tableau is

    type T_Ensemble is limited private;


    --Initialise un nvx ensemble à l'ensemble vide
    --
    --Necessite: Vrai
    --
    --Assure: Ens est vide
    procedure Initialiser(Ens: out T_Ensemble) with
            Pre => True,
            Post => Est_Vide(Ens);

    --Test si un ensemble est vide: renvoie true si Ens est vide, false sinon
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Est_vide(Ens: in T_Ensemble) return Boolean;

    --Donne la taille d'un ensemble
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Taille(Ens: in T_Ensemble) return Integer;

    --Test si l'element x est present dans Ens: retourne true si tel est le cas, false sinon
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Contient(x: in T_Element; Ens: in T_Ensemble) return Boolean;

    --Ajoute x à Ens
    --
    --Necessite: Taille(Ens) < Capacite
    --
    --Assure: Ens contient une seule fois x
    procedure Ajouter(x: in T_Element; Ens: in out T_Ensemble) with
            Pre => Taille(Ens) < Capacite,
            Post => Contient(x, Ens);

    --Supprime x à Ens
    --
    --Necessite: x appartient à Ens
    --
    --Assure: Ens ne contient pas x
    procedure Supprimer(x: in T_Element; Ens: in out T_Ensemble) with
            Pre => False,
            Post => not Contient(x, Ens);

    --Effectue Action pour tout les elments de Ens
    --
    --Necessite: vrai
    --
    --Assure: vrai
    generic
        with procedure Action(x: in T_Element);

    procedure Appliquer_Sur_Tous(Ens: in T_Ensemble);



private

    type T_Tableau is array (1..Capacite) of T_Element;

    type T_Ensemble is
        record
            Elmt: T_Tableau;
            Nb_Elmts: Integer;
        end record;


end Ensembles_Tableau;
