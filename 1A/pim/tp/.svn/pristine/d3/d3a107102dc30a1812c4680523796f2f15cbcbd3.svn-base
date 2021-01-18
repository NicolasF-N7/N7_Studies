generic
    type T_Element is private;

package Ensembles_Chainage is

    type T_Ensemble is limited private;


    --Initialise un nvx ensemble à l'ensemble vide
    --
    --Necessite: Vrai
    --
    --Assure: Ens est vide
    procedure Initialiser(E: out T_Ensemble) with
            Pre => True,
            Post => Est_Vide(E);

    --Detruire et liberer l'espace memoire occupé par l'emsemble
    --
    --Necessite: Vrai
    --
    --Assure E est la liste nulle
    procedure Detruire(E: out T_Ensemble) with
            Post => Est_Vide(E);

    --Test si un ensemble est vide: renvoie true si Ens est vide, false sinon
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Est_Vide(E: in T_Ensemble) return Boolean;

    --Donne la taille d'un ensemble
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Taille(E: in T_Ensemble) return Integer;

    --Test si l'element x est present dans Ens: retourne true si tel est le cas, false sinon
    --
    --Necessite: Vrai
    --
    --Assure: vrai
    function Contient(x: in T_Element; E: in T_Ensemble) return Boolean;

    --Ajoute x à Ens NON RECURSIF
    --
    --Necessite: Taille(E) < Capacite
    --
    --Assure: Ens contient une seule fois x
    procedure Ajouter(x: in T_Element; E: in out T_Ensemble) with
            Pre => True,
            Post => Contient(x, E);

    --Supprime x à Ens RECURSIVEMENT
    --
    --Necessite: x appartient à Ens
    --
    --Assure: Ens ne contient pas x
    procedure Supprimer(x: in T_Element; E: in out T_Ensemble) with
            Pre => True,
            Post => not Contient(x, E);

    --Effectue Action pour tout les elments de Ens
    --
    --Necessite: vrai
    --
    --Assure: vrai
    generic
        with procedure Action(x: in T_Element);
    procedure Appliquer_Sur_Tous(E: in T_Ensemble);




private
    type T_Cellule;

    type T_Ensemble is access T_Cellule;

    type T_Cellule is
        record
            Element: T_Element;
            Suivant: T_Ensemble;
        end record;


end Ensembles_Chainage;
