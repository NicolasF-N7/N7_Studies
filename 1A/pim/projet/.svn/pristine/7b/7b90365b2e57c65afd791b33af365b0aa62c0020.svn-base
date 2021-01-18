with Ada.Text_IO;use  Ada.Text_IO;
with Calendar; use Calendar;
with Liste_Chainee;


package body Registre is

    procedure Initialiser_Registre (Registre : out T_Registre) is
    begin
        for i in 1..Capacite loop
            Registre(i) := Null;
        end loop;
    end Initialiser_Registre;


    function Est_Registre_Vide (Registre : in T_Registre) return Boolean is
        Resultat: Boolean;
    begin
        Resultat:= True;
        for i in 1..Capacite loop
            if Registre(i) /= Null then
                Resultat := False;
            end if;
        end loop;
        return Resultat;
    end Est_Registre_Vide;


    function Est_Present_Registre (Registre : in T_Registre; Donnee : in T_Donnee) return Boolean is
    begin
        return Present(Registre(Donnee.Id mod Capacite, Donnee));
    end Est_Present_Registre;


    function Homonymes (Registre : in T_Registre; Nom : in String; Prenom : in String) return T_Liste is

        --Renvoie les T_Donnee des personnes homonymes à Nom Prenom dans la liste Liste
        function Homonymes_Liste(Liste : in T_Liste; Nom : in String; Prenom : in String) return T_Liste is
        begin
            if Liste=Null then
                return Null;
                --Si en tete de Liste est une personne Homonyme à prenom, nom
            elsif Liste.all.Valeur.Nom = Nom and Liste.all.Valeur.Prenom = Prenom then
                return new T_Cellule'(Liste.all.Valeur, Homonymes_Liste(Liste.all.Suivant, Nom, Prenom));
            else

            end if;


        end Homonymes_Liste;

    begin

    end Homonymes;

    procedure Ajouter_Registre (Registre : in out T_Registre; Donnee : in T_Donnee) is
    begin
        Ajouter(Registre.Tableau(Donnee.Id mod Capacite), Donnee);
    end Ajouter_Registre;

    function Donnee (Registre : in T_Registre; Id : in Integer) return T_Donnee is
        Curseur: T_Liste;
    begin
        Curseur := Registre.Tableau(Id mod Capacite);
        --Parcourt de la liste jusqu'a trouver la donnee avec le bon identifiant
        while Curseur /= Null and else Curseur.all.Valeur.Id /= Id loop
            Curseur := Curseur.all.Suivant;
        end loop;

        --Si Id inconnu
        if Curseur = Null then
            raise Unknown_ID_Exception;
        else
            return Curseur.all.Valeur;
        end if;
    end Donnee;

    procedure Modifier_Registre (Registre : in out T_Registre; Id : in Integer; New_Donnee : in T_Donnee) is
        Curseur: T_Liste;
    begin
        Curseur := Registre.Tableau(Id mod Capacite);
        --Parcourt de la liste jusqu'a trouver la donnee avec le bon identifiant
        while Curseur /= Null and else Curseur.all.Valeur.Id /= Id loop
            Curseur := Curseur.all.Suivant;
        end loop;

        --Si Id inconnu
        if Curseur = Null then
            raise Unknown_ID_Exception;
        else
            Curseur.all.Valeur := New_Donnee;
        end if;
    end Modifier_Registre;



end Registre;
