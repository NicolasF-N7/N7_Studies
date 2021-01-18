
package body Arbre_Genealogique is

    function Est_Vide_AG (Arbre : in T_Arbre_Genealogique) return boolean is
    begin
        --return Est_Vide_AB(Arbre.Arbre) and Est_Registre_Vide(Arbre.Registre);
        return Est_Vide_AB(Arbre);
    end Est_Vide_AG;

    procedure Initialiser_Arbre_Genealogique(Arbre: out T_Arbre_Genealogique; Racine : in Integer) is
    begin
        Initialiser_AB(Arbre , Racine);
    end Initialiser_Arbre_Genealogique;


    function Est_Present_Arbre_Genealogique(Arbre: in T_Arbre_Genealogique; Id_Noeud : in Integer) return Boolean is
    begin
        return Est_Present_AB(Arbre, Id_Noeud);
    end Est_Present_Arbre_Genealogique;


    procedure Ajouter_Arbre_Genealogique(Arbre: in out T_Arbre_Genealogique; Id_Fils : in Integer; Id_Parent: in Integer) is
    begin
        --attention Id_Fils correspond au pere dans l'arbre binaire
        Ajouter_AB(Arbre, Id_Fils, Id_Parent);
    end Ajouter_Arbre_Genealogique;

    function Taille_AG(Arbre: in T_Arbre_Genealogique) return Integer is
    begin
        return Taille_AB(Arbre);
    end Taille_AG;


    function Nombre_Ancetres (Arbre : in T_Arbre_Genealogique; Id_Noeud : in Integer) return Integer is
    begin
        if Est_Vide_AB(Arbre) then
            return 0;
        elsif Get_donnee(Arbre) /= Id_Noeud then
            return Nombre_Ancetres(Get_sous_arbre_gauche(Arbre), Id_Noeud) + Nombre_Ancetres(Get_sous_arbre_droit(Arbre), Id_Noeud);
        elsif Get_donnee(Arbre) = Id_Noeud then
            return Taille_AB(Arbre)-1;
        else
            return 0;
        end if;
    end Nombre_Ancetres;

    function Nombre_Parents(Arbre: in T_Arbre_Genealogique; Id_Noeud : in Integer) return Integer is
    begin
         if Est_Vide_AB(Arbre) then
            return 0;
        elsif Get_donnee(Arbre) /= Id_Noeud then
            return Nombre_Parents(Get_sous_arbre_gauche(Arbre), Id_Noeud) + Nombre_Parents(Get_sous_arbre_droit(Arbre), Id_Noeud);
        elsif Get_donnee(Arbre) = Id_Noeud then
                return Nombre_Fils(Arbre);
        else
            return 0;
        end if;
    end Nombre_Parents;

    function Un_Parent (Arbre: in T_Arbre_Genealogique) return T_Liste is
        Liste: T_Liste;
    begin
        Initialiser_Liste(Liste);
        if Est_Vide_AB(Arbre) then
            return Liste;
        elsif Nombre_Fils(Arbre) = 1 then
            Ajouter_Liste(Liste, Get_donnee(Arbre));
            Concat(Liste, Un_Parent(Get_sous_arbre_droit(Arbre)));--Liste est le resulat de la concatenation
            Concat(Liste, Un_Parent(Get_sous_arbre_gauche(Arbre)));
            return Liste;
        else
            Concat(Liste, Un_Parent(Get_sous_arbre_droit(Arbre)));
            Concat(Liste, Un_Parent(Get_sous_arbre_gauche(Arbre)));
            return Liste;
        end if;
    end Un_Parent;


    function Deux_Parents (Arbre : in T_Arbre_Genealogique) return T_Liste is
        Liste: T_Liste;
    begin
       Initialiser_Liste(Liste);
        if Est_Vide_AB(Arbre) then
            return Liste;
        elsif Nombre_Fils(Arbre) = 2 then
            Ajouter_Liste(Liste, Get_donnee(Arbre));
            Concat(Liste, Deux_Parents(Get_sous_arbre_droit(Arbre)));--Liste est le resultat de la concatenation
            Concat(Liste, Deux_Parents(Get_sous_arbre_gauche(Arbre)));
            return Liste;
        else
            Concat(Liste, Deux_Parents(Get_sous_arbre_droit(Arbre)));
            Concat(Liste, Deux_Parents(Get_sous_arbre_gauche(Arbre)));
            return Liste;
        end if;
    end Deux_Parents;

    function Inconnus (Arbre : in T_Arbre_Genealogique) return T_Liste is
        Liste: T_Liste;
    begin
        Initialiser_Liste(Liste);
        if Est_Vide_AB(Arbre) then
            return Liste;
        elsif Nombre_Fils(Arbre) = 0 then
            Ajouter_Liste(Liste, Get_donnee(Arbre));
            Concat(Liste, Inconnus(Get_sous_arbre_droit(Arbre)));--Liste est le resulat de la concatenation
            Concat(Liste, Inconnus(Get_sous_arbre_gauche(Arbre)));
            return Liste;
        else
            Concat(Liste, Inconnus(Get_sous_arbre_droit(Arbre)));
            Concat(Liste, Inconnus(Get_sous_arbre_gauche(Arbre)));
            return Liste;
        end if;
    end Inconnus;


    ---A VOIR
    function Fils(Arbre: in T_Arbre_Genealogique; Id_Noeud : in Integer) return Integer is
        F_G: Integer:= 0;
        F_D: Integer:= 0;
    begin
        --Si l'arbre est reduit a la racine
        if Taille_AB(Arbre) = 1 or Est_Vide_AB(Arbre) then
            return -1;
        --si le sous arbre gauche est le noeud cherché
        elsif not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) and then Get_donnee(Get_sous_arbre_gauche(Arbre)) = Id_Noeud then
            return Get_donnee(Arbre);
        --si le sous arbre droit est le noeud cherché
        elsif not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) and then Get_donnee(Get_sous_arbre_droit(Arbre)) = Id_Noeud then
            return Get_donnee(Arbre);
        else
            --on retourne la valeur de Fils du sous arbre gauche/droit si le noeud est present dans sous arbregauche/droit
            F_G:= Fils(Get_sous_arbre_gauche(Arbre), Id_Noeud);
            F_D:= Fils(Get_sous_arbre_droit(Arbre), Id_Noeud);
            if F_G >= 0 then
                return F_G;
            else
                return F_D;
            end if;
        end if;
    end Fils;

    function Get_Parents(Arbre: in T_Arbre_Genealogique; Noeud : in Integer) return T_Parents is
        Parents: T_Parents;
        Parents_sous_arbre_gauche: T_Parents;
        Parents_sous_arbre_droit: T_Parents;
        Id_Parent_Gauche: Integer := -1;
        Id_Parent_Droit: Integer := -1;
    begin
        Parents := T_Parents'(-1, -1);
        Parents_sous_arbre_gauche := T_Parents'(-1, -1);
        Parents_sous_arbre_droit := T_Parents'(-1, -1);

        if Taille_AB(Arbre) = 1 or Est_Vide_AB(Arbre) then
            return Parents;
        --Si la racine n'est pas le noeud dont on cherche les parents: appel recursifs sur s_ab gauche et droite
        elsif Get_donnee(Arbre) /= Noeud then
            --Si le s_ab gauche n'est pas vide
            --Recuperation des parents du noeud dans le s_ab gauche recursivement
            Parents_sous_arbre_gauche := Get_Parents(Get_sous_arbre_gauche(Arbre), Noeud);
            Parents_sous_arbre_droit := Get_Parents(Get_sous_arbre_droit(Arbre), Noeud);

            --Si le parent est dans le sous ab gauche
            if Parents_sous_arbre_gauche /= Parents then
                return Parents_sous_arbre_gauche;
            elsif Parents_sous_arbre_droit /= Parents then
                return Parents_sous_arbre_droit;
            else
                return Parents;
            end if;
        --sinon si la racine est le noeud on renvoie les ID des parents
        else
            --Recuperation des info des parents selon que le noeud possede ou non tout ses parents
            if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                Id_Parent_Gauche := Get_donnee(Get_sous_arbre_gauche(Arbre));
            end if;
            if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                Id_Parent_Droit := Get_donnee(Get_sous_arbre_droit(Arbre));
            end if;

            Parents := T_Parents'(Id_Parent_Gauche, Id_Parent_Droit);
            return Parents;
        end if;
    end Get_Parents;


    procedure Supprimer_Arbre_Genealogique(Arbre: in out T_Arbre_Genealogique; Noeud : in Integer) is
    begin
        Supprimer_AB(Arbre, Noeud);
    end Supprimer_Arbre_Genealogique;


    function Ancetres(Arbre: in T_Arbre_Genealogique; Noeud: in Integer) return Liste_Entier.T_Liste is
        Liste: Liste_Entier.T_Liste;
    begin
        Initialiser_Liste(Liste);
        if Est_Vide_AB(Arbre) then
            return Liste;
        --si la racine est seule et est le noeud cherché: on renvoie la racine
        elsif Taille_AB(Arbre) = 1 and Get_donnee(Arbre) = Noeud then
            Ajouter_Liste(Liste, Get_donnee(Arbre));
            return Liste;
        --Si le noeud racine est celui voulu
        elsif Get_donnee(Arbre) = Noeud then
            --On ajoute les ancetres du parent de gauche et de droite
            if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                Concat(Liste, Ancetres(Get_sous_arbre_gauche(Arbre), Get_donnee(Get_sous_arbre_gauche(Arbre))));
            end if;
            if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                Concat(Liste, Ancetres(Get_sous_arbre_droit(Arbre), Get_donnee(Get_sous_arbre_droit(Arbre))));
            end if;
            --Ajout du noeud racine (celui cherché)
            Ajouter_Liste(Liste, Get_donnee(Arbre));

            return Liste;
        --Si noeud pas encore trouve
        else
            if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                Concat(Liste, Ancetres(Get_sous_arbre_gauche(Arbre), Noeud));
            end if;
            if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                Concat(Liste, Ancetres(Get_sous_arbre_droit(Arbre), Noeud));
            end if;

            return Liste;
        end if;
    end Ancetres;


    function Ancetres_Generation(Arbre: in T_Arbre_Genealogique; Noeud: in Integer; N: Integer) return Liste_Entier.T_Liste is
        Liste: Liste_Entier.T_Liste;
    begin
        Initialiser_Liste(Liste);
        if Est_Vide_AB(Arbre) then
            return Liste;
        --Si le noeud racine est celui voulu
        elsif Get_donnee(Arbre) = Noeud then
            --Si on cherche les ancetre plus vieux que la position actuelle
            --Alors on concatene la liste des ancetres du s_ab gauche de gene N-1 et droit
            if N/=0 then
                if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                    Concat(Liste, Ancetres_Generation(Get_sous_arbre_gauche(Arbre), Get_donnee(Get_sous_arbre_gauche(Arbre)), N-1));
                end if;
                if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                    Concat(Liste, Ancetres_Generation(Get_sous_arbre_droit(Arbre), Get_donnee(Get_sous_arbre_droit(Arbre)), N-1));
                end if;
                return Liste;
            --Ancetre recherche sont a la position actuelle: on retourne l'ancetre ie la racine
            else
                Ajouter_Liste(Liste, Get_donnee(Arbre));
                return Liste;
            end if;
        --Si noeud pas encore trouve
        else
            if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                Concat(Liste, Ancetres_Generation(Get_sous_arbre_gauche(Arbre), Noeud, N));
            end if;
            if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                Concat(Liste, Ancetres_Generation(Get_sous_arbre_droit(Arbre), Noeud, N));
            end if;
            return Liste;
        end if;
    end Ancetres_Generation;


    function Ancetres_Generation_Plus_Petite(Arbre: in T_Arbre_Genealogique; Noeud: in Integer; N: Integer) return Liste_Entier.T_Liste is
        Liste: Liste_Entier.T_Liste;
    begin
        Initialiser_Liste(Liste);
        if Est_Vide_AB(Arbre) then
            return Liste;
        --Si le noeud racine est celui voulu
        elsif Get_donnee(Arbre) = Noeud then
            --Si on cherche les ancetre plus vieux que la position actuelle
            --Alors on concatene la liste des ancetres du s_ab gauche de gene N-1 et droit
            if N>=0 then
                if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                    Concat(Liste, Ancetres_Generation_Plus_Petite(Get_sous_arbre_gauche(Arbre), Get_donnee(Get_sous_arbre_gauche(Arbre)), N-1));
                end if;
                if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                    Concat(Liste, Ancetres_Generation_Plus_Petite(Get_sous_arbre_droit(Arbre), Get_donnee(Get_sous_arbre_droit(Arbre)), N-1));
                end if;

                Ajouter_Liste(Liste, Get_donnee(Arbre));
                return Liste;
            else--Si on dépasse les ancetre de gene N par rapport au noeud initial
                return Liste;
            end if;
        --Si noeud pas encore trouve
        else
            if not Est_Vide_AB(Get_sous_arbre_gauche(Arbre)) then
                Concat(Liste, Ancetres_Generation_Plus_Petite(Get_sous_arbre_gauche(Arbre), Noeud, N));
            end if;
            if not Est_Vide_AB(Get_sous_arbre_droit(Arbre)) then
                Concat(Liste, Ancetres_Generation_Plus_Petite(Get_sous_arbre_droit(Arbre), Noeud, N));
            end if;

            return Liste;
        end if;
    end Ancetres_Generation_Plus_Petite;


    procedure Afficher_AG(Arbre: in T_Arbre_Genealogique) is
    begin
        if Est_Vide_AB(Arbre) then
            null;
        elsif Taille_AB(Arbre) = 1 then
            Put_Line(Integer'Image(Get_donnee(Arbre)));
        else
            Put("    ");
            Afficher_AG(Get_sous_arbre_gauche(Arbre));
            Put("    ");
            Afficher_AG(Get_sous_arbre_droit(Arbre));
        end if;
    end Afficher_AG;

    function Get_Sous_AG_Gauche(Arbre: in T_Arbre_Genealogique) return T_Arbre_Genealogique is
    begin
        return Get_sous_arbre_gauche(Arbre);
    end Get_Sous_AG_Gauche;

    function Get_Sous_AG_Droit(Arbre: in T_Arbre_Genealogique) return T_Arbre_Genealogique is
    begin
        return Get_sous_arbre_droit(Arbre);
    end Get_Sous_AG_Droit;

    function Get_Racine(Arbre: in T_Arbre_Genealogique) return Integer is
    begin
        return Get_donnee(Arbre);
    end Get_Racine;

    procedure Detruire_Arbre_Genealogique(Arbre: in out T_Arbre_Genealogique) is
    begin
        Detruire_AB(Arbre);
    end Detruire_Arbre_Genealogique;



end Arbre_Genealogique;
