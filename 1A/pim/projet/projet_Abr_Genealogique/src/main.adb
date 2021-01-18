with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Calendar; use Calendar;
with Ada.Text_IO, Ada.Characters.Handling;--Pour modifier la casse d'une chaine de caractere
use Ada.Text_IO, Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Arbre_Genealogique;-- Contient aussi Liste_Entier
with registre;

procedure main is
    
    -- Instanciation des packages registre, où est instancié Liste_Donnee
    package Registre_20 is
            new Registre(20);
    use Registre_20;
    
    --Procédure qui permet d'afficher une Donnee de type T_Donnee
    procedure Aff_Donnee(x: in T_Donnee) is
        jour: Integer;
        mois: Integer;
        annee: Integer;
        sec: Standard.Duration;
    begin
        Split(x.Date_Naissance, annee, mois, jour, sec);
        if x.Sexe = Homme then
            Put_Line(To_String(x.Prenom) & " " & To_String(x.Nom) & " Homme" & " " & Integer'Image(jour) & "/" & Integer'Image(mois) & "/" & Integer'Image(annee));
        else
            Put_Line(To_String(x.Prenom) & " " & To_String(x.Nom) & " Femme" & Integer'Image(jour) & "/" & Integer'Image(mois) & "/" & Integer'Image(annee));
        end if;
    end Aff_Donnee;
    
    procedure Afficher_Liste_Donnee is new Registre_20.Liste_Donnee.Appliquer_Sur_Tous(Aff_Donnee);
   
    -- Permet d'obtenir une date au clavier
    procedure get_date(date: out Time) is
        year: string(1..4);
        month: string(1..2);
        day: string(1..2);
        buffer: Character;
        valide_entry: Boolean := False;
    begin
        while not valide_entry loop
            Put_Line("Veuillez respecter le format jj/mm/aaaa");
            get(day);
            get(buffer);
            if buffer = '/' then
                valide_entry := True;
            end if;
        
            get(month);
            get(buffer);
            if buffer = '/' then
                valide_entry := True;
            end if;
        
            get(year);
            date := Time_of(Integer'Value(year), Integer'Value(month), Integer'Value(day), 0.0);
        end loop;
    end get_date;
    
    -- Permet d'obtenir un type string
    procedure get_unbounded_string(ustr: out Unbounded_String) is
    begin
        ustr := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Text_IO.Get_Line);
    end get_unbounded_string;
                           
    --Permet d'obtenir un type T_sexe homme ou femme                      
    function get_sexe(sexe: out T_Sexe) return Boolean is
        text: string(1..5);--5=longueur("Homme" et "Femme")
        valide_entry: Boolean := False;
    begin
        
        while not valide_entry loop
            Put_Line("Veuillez entrer homme ou femme");
            Get(text);
            
            if To_Lower(text) = "homme" then
                sexe := Homme;
                valide_entry := True;
            elsif To_Lower(text) = "femme" then
                sexe := Femme;
                valide_entry := True;
            else
                valide_entry := False;
            end if;
        end loop;
        
        return valide_entry;
    exception
        when Data_Error => return False;
    end get_sexe;
    
    
    procedure Afficher_Ag_convivialement(Arbre: in Arbre_Genealogique.T_Arbre_Genealogique; Reg: in Registre_20.T_Registre; Indentation: Integer) is
        Noeud_Donnee : T_Donnee;
    begin
        if Arbre_Genealogique.Est_Vide_AG(Arbre) then
            null;
        end if;
        
        Noeud_Donnee := Registre_20.Obtenir_Donnee(Reg, Arbre_Genealogique.Get_Racine(Arbre));--donnee associee a la racine de l'arbre
        
        --Affichage du sous arbre gauche
        if not Arbre_Genealogique.Est_Vide_AG(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre)) then            
            Afficher_Ag_convivialement(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre), Reg, Indentation+1);
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
        Aff_Donnee(Noeud_Donnee);
        
        --Affichage du sous arbre droit
        if not Arbre_Genealogique.Est_Vide_AG(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre)) then
            New_Line;
            Afficher_Ag_convivialement(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre), Reg, Indentation+1);
        end if;
    end Afficher_Ag_convivialement;
    
    
    
    procedure Afficher_Ag_convivialement_A_Partir_Noeud(Arbre: in Arbre_Genealogique.T_Arbre_Genealogique; Reg: in Registre_20.T_Registre; Id_Noeud: in Integer; Indentation: Integer) is
        Noeud_Donnee : T_Donnee;
    begin
        if Arbre_Genealogique.Est_Vide_AG(Arbre) then
            null;
        end if;
        
        Noeud_Donnee := Registre_20.Obtenir_Donnee(Reg, Arbre_Genealogique.Get_Racine(Arbre));--donnee associee a la racine de l'arbre
        
        if Noeud_Donnee.Id = Id_Noeud then
            --Affichage du sous arbre gauche
            
            if not Arbre_Genealogique.Est_Vide_AG(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre)) then
                Afficher_Ag_convivialement_A_Partir_Noeud(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre), Reg, Arbre_Genealogique.Get_Racine(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre)),Indentation+1);
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
            Aff_Donnee(Noeud_Donnee);
        
            --Affichage du sous arbre droit
            
            if not Arbre_Genealogique.Est_Vide_AG(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre)) then
                New_Line;
                Afficher_Ag_convivialement_A_Partir_Noeud(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre), Reg, Arbre_Genealogique.Get_Racine(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre)), Indentation+1);
            end if;
        else
            if not Arbre_Genealogique.Est_Vide_AG(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre)) then
                Afficher_Ag_convivialement_A_Partir_Noeud(Arbre_Genealogique.Get_Sous_AG_Gauche(Arbre), Reg, Id_Noeud,Indentation);
            end if;
            if not Arbre_Genealogique.Est_Vide_AG(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre)) then
                Afficher_Ag_convivialement_A_Partir_Noeud(Arbre_Genealogique.Get_Sous_AG_Droit(Arbre), Reg, Id_Noeud, Indentation);
            end if;
        end if;
        
    end Afficher_Ag_convivialement_A_Partir_Noeud;
    
    --Affiche les donnee associées a la liste d'ID
    procedure Afficher_Liste_Donnee_A_Partir_ID(Liste: in Arbre_Genealogique.Liste_Entier.T_Liste; Registre : in Registre_20.T_Registre) is
        Donnee: T_Donnee;
    begin
        -- si liste est vide: rien a faire
        if Arbre_Genealogique.Liste_Entier.Est_Liste_Vide(Liste) then
            null;
        else
            Donnee := Registre_20.Obtenir_Donnee(Registre, Arbre_Genealogique.Liste_Entier.Tete_Liste(Liste));
            
            Aff_Donnee(Donnee);
            Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Liste_Entier.Queue_Liste(Liste), Registre);
        end if;
        
    end Afficher_Liste_Donnee_A_Partir_ID;
    
            
    --Variables
    
    --Le booléan permettant de terminer le programme
    continuer : boolean := true;
    
    --L'arbre généalogique utilisé et initialisé à chaque début de programme
    Arbre : Arbre_Genealogique.T_Arbre_Genealogique; 
    
    --Le registre utilisé et initialisé à chaque début de programme
    Registre : T_Registre;
    
    --La racine de l'arbre 
    Racine : T_Donnee;
    
    --Le choix de l'utilisateur pour l'action à effectuer sur son arbre
    choix : integer;
    
    --Les listes des homonymes
    Liste_Homonymes : Registre_20.Liste_Donnee.T_Liste;
    Liste_Homonymes1 : Registre_20.Liste_Donnee.T_Liste;
    Liste_Homonymes2 : Registre_20.Liste_Donnee.T_Liste;
    Liste : Registre_20.Liste_Donnee.T_Liste;
    
    --Le choix de l'utilisateur pour le bon noeud affiché dans Liste_Homonymes
    choix_homonymes : Integer;
    
    --Les données 
    Donnee_Noeud : T_Donnee;
    Donnee_Parent : T_Donnee;
    Donne1 : T_Donnee;
    Donne2 : T_Donnee;
    
    --Le nombre de générations après un noeud
    n : Integer;
    
    --Le nombre d'ancetres d'un noeud
    nb_ancetres : Integer;
    
begin
    --On demande à l'utilisateur les données de la racine pour initialiser l'arbre
    Put_Line("Pour initialiser votre arbre, Veuillez entrer un noeud racine pour votre arbre");
    Put_Line("Donnez son Prénom:");
    get_unbounded_string(Racine.Prenom);
    Put_Line("Donnez son Nom");
    get_unbounded_string(Racine.Nom);
    Put_Line("Donnez sa date de naissance");
    get_date(Racine.Date_Naissance);
    Put_Line("Donnez son sexe");
    while not get_sexe(Racine.Sexe) loop
        null;
    end loop;
    --L'identifiant de la racine est prit égal à 0
    Racine.Id := 1;
    --On initialise l'arbre avec la racine et on l'affiche.
    Arbre_Genealogique.Initialiser_Arbre_Genealogique(Arbre, Racine.Id);
    Initialiser_Registre(Registre);
    Ajouter_Registre(Registre,Racine);
    Put_Line("L'arbre et le registre sont initialisés:");
    Afficher_Ag_convivialement(Arbre, Registre, 0); New_Line;
    --Boucle qui permet de faire des modifications dans l'arbre ou de quitter le programme
    while continuer loop
        --On demande à l'utilisateur l'action qu'il souhaite faire
        Put_Line("Quelle action souhaitez-vous faire parmis celles-ci?");
        Put_Line("1 - Ajouter un parent à un noeud");
        Put_Line("2 - Obtenir le nombre d'ancêtres connus d'un individu");
        Put_Line("3 - Obtenir l'ensemble des ancêtres situés à une certaine génération d'un noeud");
        Put_Line("4 - Afficher l'arbre à partir d'un noeud");
        Put_Line("5 - Afficher l'arbre ");
        Put_Line("6 - Supprimer un noeud et ses ancêtres");
        Put_Line("7 - Obtenir l'ensemble des individus qui n'ont qu'un parent connu");
        Put_Line("8 - Obtenir l'ensemble des individus dont les deux parents sont connus");
        Put_Line("9 - Obtenir l'ensemble des individus dont les deux parents sont inconnus");
        Put_Line("10 - Afficher les ancêtres d'un individu sur n générations");
        Put_Line("11 - Vérifier si deux individus ont au moins un ancêtre homonyme");
        Put_Line("0 - Quitter ");
        Put_Line("Donnez votre choix:");
        Get(choix);
        --Si le choix n'est pas compris entre ceux proposés, on lui redemande
        while choix > 11 or choix < 0 loop
            Put_Line("Votre choix doit être compris entre 0 et 10");
            Get(choix);
        end loop;
        Skip_Line;--vider le buffer de l'entree clavier pour la saisie suivante
        --Selon le choix on effectue une action
        case choix is 
            when 0 => Put_line("-0-");continuer := False;
                Arbre_Genealogique.Detruire_Arbre_Genealogique(Arbre);
                Detruire_Registre(Registre);
            when 1 => Put_line("-1-");
                --On demande le nom, prénom liés au noeud que la personne souhaite utiliser
                Put_Line("    Veuillez donner le Prenom du noeud à partir duquel vous souhaitez ajouter cette personne");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                --On cherche ses homonymes et on les affiche
                --Mettre une condition si on ne trouve personne? 
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes);
                if Liste_Donnee.Est_Liste_Vide(Liste_Homonymes) then 
                    Put_Line("    Il n'y a personne de ce prénom et nom dans l'arbre. Veuillez recommencer avec une autre donnée.");
                elsif Liste_Donnee.Taille_Liste(Liste_Homonymes) = 1 then
                    Donnee_Noeud := Liste_Donnee.Tete_Liste(Liste_Homonymes);
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    Veuillez entrer les données pour le parent à ajouter:");         
                    Put_Line("    Donnez son Prénom:");
                    get_unbounded_string(Donnee_Parent.Prenom);
                    Put_Line("    Donnez son Nom");
                    get_unbounded_string(Donnee_Parent.Nom);
                    Put_Line("    Donnez sa date de naissance");
                    get_date(Donnee_Parent.Date_Naissance);
                    Put_Line("    Donnez son sexe");
                    
                    while not get_sexe(Donnee_Parent.Sexe) loop
                        null;
                    end loop;
                    Donnee_Parent.Id := Taille_Registre(Registre) + 1;
                    Arbre_Genealogique.Ajouter_Arbre_Genealogique(Arbre,Donnee_Noeud.Id,Donnee_Parent.Id);         
                    Ajouter_Registre(Registre,Donnee_Parent);
                    Afficher_Ag_convivialement(Arbre, Registre, 0); New_Line;
                else
                    Afficher_Liste_Donnee(Liste_Homonymes);
                    Put_Line("    Veuillez choisir la bonne personne parmi celles-ci: entrez n>=1 pour la nieme personne");
                    Get(choix_homonymes);
                    Skip_Line;
                    Donnee_Noeud := Liste_Donnee.N_eme_Element(Liste_Homonymes, choix_homonymes-1);
                    Put_Line("    La personne choisis est: ");
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    Veuillez entrer les données pour le parent à ajouter:");         
                    Put_Line("    Donnez son Prénom:");
                    get_unbounded_string(Donnee_Parent.Prenom);
                    Put_Line("    Donnez son Nom");
                    get_unbounded_string(Donnee_Parent.Nom);
                    Put_Line("    Donnez sa date de naissance");
                    get_date(Donnee_Parent.Date_Naissance);
                    Put_Line("    Donnez son sexe");
                    
                    while not get_sexe(Donnee_Parent.Sexe) loop
                        null;
                    end loop;
                    Donnee_Parent.Id := Taille_Registre(Registre) + 1;      
                    Arbre_Genealogique.Ajouter_Arbre_Genealogique(Arbre,Donnee_Noeud.Id,Donnee_Parent.Id);         
                    Ajouter_Registre(Registre,Donnee_Parent);
                    Afficher_Ag_convivialement(Arbre, Registre, 0); New_Line;
                end if;
                             
           when 2 => Put_line("-2-");
                Put_Line("    Veuillez donner le prénom de ce noeud dont vous souhaitez connaître les ancêtres");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes);
                if Liste_Donnee.Est_Liste_Vide(Liste_Homonymes) then 
                    Put_Line("    Il n'y a personne de ce prénom et nom dans l'arbre. Veuillez recommencer avec une autre donnée.");
                elsif Liste_Donnee.Taille_Liste(Liste_Homonymes) = 1 then
                    Donnee_Noeud := Liste_Donnee.Tete_Liste(Liste_Homonymes);
                    Put_Line("    Le nombre d'ancetres connus de ");
                    Aff_Donnee(Donnee_Noeud);
                    nb_ancetres := Arbre_Genealogique.Nombre_Ancetres(Arbre, Donnee_Noeud.Id);
                    Put_Line("est : " & Integer'Image(nb_ancetres));           
                else  
                    Afficher_Liste_Donnee(Liste_Homonymes);
                    Put_Line("    Veuillez choisir la bonne personne parmi celles-ci: entrez n>=1 pour la nieme personne");
                    Get(choix_homonymes);
                    Skip_Line;
                    Donnee_Noeud := Liste_Donnee.N_eme_Element(Liste_Homonymes, choix_homonymes-1);
                    Put_Line("    La personne choisis est: ");
                    Aff_Donnee(Donnee_Noeud);
                    nb_ancetres := Arbre_Genealogique.Nombre_Ancetres(Arbre, Donnee_Noeud.Id);
                    Put_Line("    Le nombre d'ancetres connus de cette personne est: " & Integer'Image(nb_ancetres));                                
                end if;
           when 3 => Put_line("-3-");Put_Line("    Veuillez donner la générations des ancetres que vous souhaitez obtenir à partire d'une personne que vous allez choisir.");
                Get(n);
                Skip_Line;
                Put_Line("    Veuillez donner le prénom de la personne dont vous souhaitez connaître les ancêtres");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes);
                if Liste_Donnee.Est_Liste_Vide(Liste_Homonymes) then 
                    Put_Line("    Il n'y a personne de ce prénom et nom dans l'arbre. Veuillez recommencer avec une autre donnée.");
                elsif Liste_Donnee.Taille_Liste(Liste_Homonymes) = 1 then
                    Donnee_Noeud := Liste_Donnee.Tete_Liste(Liste_Homonymes);
                    Put_Line("    La personne selectionnee est:");
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    Voici la liste des ses ancetres");
                    Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Ancetres_Generation(Arbre,Donnee_Noeud.Id,n), Registre);
                else  
                    Afficher_Liste_Donnee(Liste_Homonymes);
                    Put_Line("    Veuillez choisir la bonne personne parmi celles-ci: entrez n>=1 pour la nieme personne");
                    Get(choix_homonymes);
                    Skip_Line;
                    Donnee_Noeud := Liste_Donnee.N_eme_Element(Liste_Homonymes, choix_homonymes-1);
                    Put_Line("    La personne choisis est: ");
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    La personne selectionnee est:");
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    Voici la liste des ses ancetres");
                    Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Ancetres_Generation(Arbre,Donnee_Noeud.Id,n), Registre);
                  end if;                                              
            when 4 =>  Put_line("-4-");Put_Line("    Veuillez donner le prénom de la personne dont vous souhaitez faire apparaître l'arbre à partir de celui-ci");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes);
                if Liste_Donnee.Est_Liste_Vide(Liste_Homonymes) then 
                    Put_Line("    Il n'y a personne de ce prénom et nom dans l'arbre. Veuillez recommencer avec une autre donnée.");
                elsif Liste_Donnee.Taille_Liste(Liste_Homonymes) = 1 then
                    Donnee_Noeud := Liste_Donnee.Tete_Liste(Liste_Homonymes);
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    L'arbre à partir de cette personne s'affiche:");  
                    Afficher_Ag_convivialement_A_Partir_Noeud(Arbre, Registre, Donnee_Noeud.Id, 0);
                else  
                    Afficher_Liste_Donnee(Liste_Homonymes);
                    Put_Line("    Veuillez choisir la bonne personne parmi celles-ci: entrez n>=1 pour la nieme personne");
                    Get(choix_homonymes);
                    Skip_Line;
                    Donnee_Noeud := Liste_Donnee.N_eme_Element(Liste_Homonymes, choix_homonymes-1); 
                    Put_Line("    La personne choisis est: ");
                    Aff_Donnee(Donnee_Noeud);
                    Put_Line("    L'arbre à partir de cette personne s'affiche:");           
                    Afficher_Ag_convivialement_A_Partir_Noeud(Arbre, Registre, Donnee_Noeud.Id, 0);
                end if;  
            when 5 =>  Put_line("-5-"); Put_Line("    L'arbre s'affiche:");
                    Afficher_Ag_convivialement(Arbre, Registre, 0);    New_Line;
            when 6 => Put_line("-6-"); Put_Line("    Veuillez donner le prénom de la personne que vous souhaitez supprimer");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes);
                if Liste_Donnee.Est_Liste_Vide(Liste_Homonymes) then 
                    Put_Line("    Il n'y a personne de ce prénom et nom dans l'arbre. Veuillez recommencer avec une autre donnée.");
                elsif Liste_Donnee.Taille_Liste(Liste_Homonymes) = 1 then
                    Donnee_Noeud := Liste_Donnee.Tete_Liste(Liste_Homonymes);
                    Aff_Donnee(Donnee_Noeud);
                    Arbre_Genealogique.Supprimer_Arbre_Genealogique(Arbre, Donnee_Noeud.Id);
                    Supprimer_Registre(Registre,Donnee_Noeud.Id);
                else  
                    Afficher_Liste_Donnee(Liste_Homonymes);
                    Put_Line("    Veuillez choisir la bonne personne parmi celles-ci: entrez n>=1 pour la nieme personne");
                    Get(choix_homonymes);
                    Skip_Line;
                    Donnee_Noeud := Liste_Donnee.N_eme_Element(Liste_Homonymes, choix_homonymes-1);
                    Put_Line("    La personne choisis est: ");
                    Aff_Donnee(Donnee_Noeud);
                    Arbre_Genealogique.Supprimer_Arbre_Genealogique(Arbre, Donnee_Noeud.Id);
                    Supprimer_Registre(Registre,Donnee_Noeud.Id);
                    end if;
            when 7 => Put_line("-7-");Put_Line("    Voici la liste des personne qui ne possedent qu'un seul parent dans l'arbre genealogique:");
                Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Un_Parent(Arbre), Registre);
            when 8 => Put_line("-8-");Put_Line("    Voici la liste des personne qui possedent deux parents dans l'arbre genealogique:");    
                Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Deux_Parents(Arbre), Registre);
            when 9 =>  Put_line("-9-");Put_Line("    Voici la liste des personne qui ne possedent aucuns parents dans l'arbre genealogique:");
                Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Inconnus(Arbre), Registre);
            when 10 => Put_line("-10-");Put_Line("    Veuillez donner le nombre de générations maximale des ancetres que vous voulez afficher a partire de la personne que vous allez choisir");
                Get(n);
                Skip_Line;
                Put_Line("    Veuillez donner le prénom de cette personne dont vous souhaitez connaître les ancêtres");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes);
                if Liste_Donnee.Est_Liste_Vide(Liste_Homonymes) then 
                    Put_Line("    Il n'y a personne de ce prénom et nom dans l'arbre. Veuillez recommencer avec une autre donnée.");
                elsif Liste_Donnee.Taille_Liste(Liste_Homonymes) = 1 then
                    Donnee_Noeud := Liste_Donnee.Tete_Liste(Liste_Homonymes);
                    Aff_Donnee(Donnee_Noeud);
                    Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Ancetres_Generation_Plus_Petite(Arbre,Donnee_Noeud.Id, n), Registre);
                else
                    Afficher_Liste_Donnee(Liste_Homonymes);
                    loop
                        Put_Line("    Veuillez choisir la bonne personne parmi celles-ci: entrez n>=1 pour la nieme personne");
                        Get(choix_homonymes);
                        Skip_Line;
                        exit when choix_homonymes >= 1 and choix_homonymes <= Liste_Donnee.Taille_Liste(Liste_Homonymes);
                    end loop;
                    Donnee_Noeud := Liste_Donnee.N_eme_Element(Liste_Homonymes, choix_homonymes-1);
                    Put_Line("    La personne choisis est: ");
                    Aff_Donnee(Donnee_Noeud);
                    Afficher_Liste_Donnee_A_Partir_ID(Arbre_Genealogique.Ancetres_Generation_Plus_Petite(Arbre,Donnee_Noeud.Id, n), Registre);
                end if;                                                                                     
            when 11 => Registre_20.Liste_Donnee.Initialiser_Liste(Liste);
                Registre_20.Liste_Donnee.Initialiser_Liste(Liste_Homonymes1);
                Registre_20.Liste_Donnee.Initialiser_Liste(Liste_Homonymes2);
                
                Put_line("-11-");Put_Line("    Veuillez donner le prénom de la premiere personne dont vous souhaitez savoir si il possède un homonyme avec quelqu'un d'autre");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes1);
                
                Put_Line("    Veuillez donner le prénom du deuxieme parent dont vous souhaitez savoir si il possède un homonyme avec l'autre parent");
                get_unbounded_string(Donnee_Noeud.Prenom);
                Put_Line("    Veuillez donner son nom");
                get_unbounded_string(Donnee_Noeud.Nom);
                Homonymes(Registre,Donnee_Noeud.Prenom,Donnee_Noeud.Nom,Liste_Homonymes2);  
                
                Liste_Donnee.Intersection(Liste_Homonymes1,Liste_Homonymes2, Liste);
                Put_Line("    Voici la liste des homonymes communs aux deux personne saisies");
                Afficher_Liste_Donnee(Liste);
            when others => Put_Line("    Veuillez saisir un nombre entre 0 et 11");                                                                
        end case;
        New_Line;
        New_Line;
    end loop;
            
end main;
