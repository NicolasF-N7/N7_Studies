--Implantation du module Liste_Chainee.
with Ada.unchecked_Deallocation;

package body Liste_Chainee is

        procedure Free is 
                new Ada.unchecked_Deallocation (T_Cellule, T_Liste);

        procedure Initialiser_Liste (Liste : out T_Liste) is
        begin
                Liste := Null;
        end Initialiser_Liste;
        
        procedure Detruire_Liste (Liste : in out T_Liste) is 
        begin
                if Liste /= Null then
                        Detruire_Liste (Liste.all.suivant);
                        Free(Liste);
                else
                        null;
                end if;
        end Detruire_Liste;
        
        function Est_Liste_Vide (Liste : in T_Liste) return boolean is
        begin
                return Liste = Null;
        end Est_Liste_Vide;
        
        function Taille_Liste (Liste : in T_Liste) return Integer is 
        begin
                if Est_Liste_Vide(Liste) then
                        return 0;
                else
                        return Taille_Liste(Liste.all.suivant) + 1;
                end if;
        end Taille_Liste;
        
        function Present_Liste (Liste : in T_Liste; Element : in T_Element) return boolean is
                New_Lis : T_Liste := Liste;
        begin
                while New_Lis /= Null and then New_Lis.all.Valeur /= Element loop
                        New_Lis := New_Lis.all.suivant;
                end loop;
                return not Est_Liste_Vide (New_Lis);
        end Present_Liste;
        
    
    function Tete_Liste(Liste: in T_Liste) return T_Element is
    begin
        return Liste.all.Valeur;
    end Tete_Liste;
    
    
    function Queue_Liste(Liste: in T_Liste) return T_Liste is
    begin
        return Liste.all.Suivant;
    end Queue_Liste;
    
    
    procedure Concat(L1: in out T_Liste; L2: in T_Liste) is
    begin
        --Si on est au bout de la liste L1: fini : L1 = L2
        if L1=Null then
            L1 := L2;
        elsif L2 = Null then
            null;
        else-- sinon on parcourt L1
            Concat(L1.all.Suivant, L2);
        end if;
    end Concat;
    
    
    procedure Modifier_Liste(Liste: in T_Liste; Element :T_Element; New_Element: T_Element) is
        Curseur: T_Liste;
    begin
        Curseur := Liste;
        
        while Curseur /= Null and then Curseur.all.Valeur /= Element loop
            Curseur := Curseur.all.Suivant;
        end loop;
        
        --Si Element non trouvé
        if Curseur = Null then
            raise Unknown_Element_Exception;
        else
            Curseur.all.Valeur := New_Element;
        end if;
    end Modifier_Liste;
    
    
        procedure Ajouter_Liste (Liste : in out T_Liste; Element : in T_Element) is
                New_Lis : T_Liste;    
        begin
                New_Lis := New T_Cellule;
                New_Lis.all.suivant := Liste;
                New_Lis.all.valeur := Element;
                Liste := New_Lis;       
        end Ajouter_Liste;
        
    procedure Supprimer_Liste (Liste : in out T_Liste; Element : in T_Element) is
        ListeCpy : T_Liste;
        begin
        if Liste.all.Valeur = Element then
            ListeCpy := Liste;
            Liste := Liste.all.suivant;
            Free(ListeCpy);
        else
            Supprimer_Liste (Liste.all.suivant, Element);
        end if;
    end Supprimer_Liste;
        
        procedure Appliquer_Sur_Tous (Liste : in T_Liste) is
                New_Lis : T_Liste := Liste;
        begin
                while New_Lis /= Null loop
                        Appliquer_Sur_Element (New_Lis.Valeur);
                        New_Lis := New_Lis.all.suivant;
                end loop;
        end Appliquer_Sur_Tous;
        
end Liste_Chainee;
