with Ada.Text_IO;use  Ada.Text_IO;
with Calendar; use Calendar;
with Liste_Chainee;


package body Registre is

    procedure Initialiser_Registre (Registre : out T_Registre) is
        tmpListe: Liste_Donnee.T_Liste;
    begin
        --On Initialise toutes les listes a la liste Null
        for i in 1..Capacite loop
            Initialiser_Liste(tmpListe);
            Registre.Tableau(i) := tmpListe;
        end loop;

        Registre.Nb_Individus := 0;
    end Initialiser_Registre;


    function Est_Registre_Vide (Registre : in T_Registre) return Boolean is
        Resultat: Boolean;
    begin
        --On parcourt le registre, si toutes les listes son vides alors le registre est vide
        Resultat:= True;
        for i in 1..Capacite loop
            if not Est_Liste_Vide(Registre.Tableau(i)) then
                Resultat := False;
            end if;
        end loop;
        return Resultat;
    end Est_Registre_Vide;


    function Est_Present_Registre (Registre : in T_Registre; Donnee : in T_Donnee) return Boolean is
    begin
        return Present_Liste(Registre.Tableau(Donnee.Id mod Capacite), Donnee);
    end Est_Present_Registre;


    function Est_Present_Registre (Registre : in T_Registre; Id : in Integer) return boolean is
    begin
       return Present_Liste(Registre.Tableau(Id mod Capacite), Obtenir_Donnee(Registre, Id));
    exception--On attrape l'exception souleve par Obtenir_Donnee si ID n'existe pas
            when Unknown_ID_Exception => return False;
    end Est_Present_Registre;


    procedure Homonymes (Registre : in T_Registre; Prenom : in Unbounded_String; Nom : in Unbounded_String; Liste_Homonymes: out Liste_Donnee.T_Liste)  is

        --Modifie la liste Liste_Homonymes qui contiendra les personnes homonymes à Nom Prenom dans la liste Liste
        procedure Homonymes_Liste(Liste : in T_Liste; Prenom : in Unbounded_String; Nom : in Unbounded_String; Liste_Homonymes: out  Liste_Donnee.T_Liste) is
        begin
            if Est_Liste_Vide(Liste) then
                Null;
            --Si il y a une personne Homonyme à prenom, nom en tete de Liste
            elsif Tete_Liste(Liste).Nom = Nom and Tete_Liste(Liste).Prenom = Prenom then
                Ajouter_Liste(Liste_Homonymes, Tete_Liste(Liste));
            else
                Homonymes_Liste(Queue_Liste(Liste), Nom, Prenom, Liste_Homonymes);
            end if;
        end Homonymes_Liste;

        Liste_Temporaire: Liste_Donnee.T_Liste;
    begin
        Initialiser_Liste(Liste_Homonymes);

        for i in 1..Capacite loop
            Homonymes_Liste(Registre.Tableau(i), Prenom, Nom, Liste_Homonymes);
        end loop;
    end Homonymes;


    procedure Ajouter_Registre (Registre : in out T_Registre; Donnee : in T_Donnee) is
    begin
        --Ajout de la donnee dans le bonne liste
        Ajouter_Liste(Registre.Tableau(Donnee.Id mod Capacite), Donnee);
        Registre.Nb_Individus := Registre.Nb_Individus +1;
    end Ajouter_Registre;


    function Obtenir_Donnee (Registre : in T_Registre; Id : in Integer) return T_Donnee is
        Curseur: T_Liste;
    begin
        Curseur := Registre.Tableau(Id mod Capacite);
        --Parcourt de la liste jusqu'a trouver la donnee avec le bon identifiant
        while not(Est_Liste_Vide(Curseur)) and then Tete_Liste(Curseur).Id /= Id loop
            Curseur := Queue_Liste(Curseur);
        end loop;

        --Si Id inconnu souleve Unknown_ID_Exception
        if Est_Liste_Vide(Curseur) then
            raise Unknown_ID_Exception;
        else
            return Tete_Liste(Curseur);
        end if;
    end Obtenir_Donnee;


    procedure Modifier_Registre (Registre : in out T_Registre; Old_Donnee : in T_Donnee; New_Donnee : in T_Donnee) is
        Liste: T_Liste;
        New_Donnee_Copy: T_Donnee;--Normalement inutile si les pre-post conditions marchent
    begin
        --Modifier la liste contenenant la donnee voulue
        New_Donnee_Copy := New_Donnee;
        New_Donnee_Copy.Id := Old_Donnee.Id;--Car preconditions ne marchent pas
        Liste := Registre.Tableau(Old_Donnee.Id mod Capacite);
        Modifier_Liste(Liste, Old_Donnee, New_Donnee_Copy);
    end Modifier_Registre;


    procedure Modifier_Registre (Registre : in out T_Registre; Id : in Integer; New_Donnee : in T_Donnee) is
        Liste: T_Liste;
        New_Donnee_Copy: T_Donnee;--Normalement inutile si les pre-post conditions marchent
    begin
        New_Donnee_Copy := New_Donnee;
        New_Donnee_Copy.Id := Id;--Car preconditions ne marchent pas
        Liste := Registre.Tableau(Id mod Capacite);
        Modifier_Liste(Liste, Obtenir_Donnee(Registre, Id), New_Donnee_Copy);
    end Modifier_Registre;


    procedure Supprimer_Registre(Registre : in out T_Registre; Donnee : in T_Donnee) is-- [ | ] --> [ | ] --> [ | ] --> [ |Null]
    begin
        if Liste_Donnee.Present_Liste(Registre.Tableau(Donnee.Id mod Capacite), Donnee) then
            Supprimer_Liste(Registre.Tableau(Donnee.Id mod Capacite), Donnee);
            Registre.Nb_Individus := Registre.Nb_Individus -1;
        else
            null;
        end if;
    end Supprimer_Registre;

    procedure Supprimer_Registre(Registre : in out T_Registre; Id : in Integer) is
        begin--ATTENTION ne pas faire  Liste := Registre.Tableau(Id mod Capacite); puis supprimer Liste, Donnee associee a Id: ne marche pas dans le cas ou on supprime la tete de liste
        if Liste_Donnee.Present_Liste(Registre.Tableau(Id mod Capacite), Obtenir_Donnee(Registre, Id)) then
            Supprimer_Liste(Registre.Tableau(Id mod Capacite), Obtenir_Donnee(Registre, Id));
            Registre.Nb_Individus := Registre.Nb_Individus -1;
        else
            null;
        end if;
    end Supprimer_Registre;


    function Taille_Registre (Registre : in T_Registre) return Integer is
        Taille: Integer;
    begin
        --Somme des taille des listes
        --Taille := 0;
        --for i in 1..Capacite loop
        --    Taille := Taille + Taille_Liste(Registre.Tableau(i));
        --end loop;
        --return Taille;
        return Registre.Nb_Individus;
    end Taille_Registre;


    procedure Detruire_Registre (Registre : in out T_Registre) is
    begin
        --Detruire toutes les listes
        for i in 1..Capacite loop

            Detruire_Liste(Registre.Tableau(i));
        end loop;
    end Detruire_Registre;

end Registre;
