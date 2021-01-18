with Ada.Text_IO;                 use Ada.Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Unchecked_Deallocation;

package body Vecteurs_Creux is


	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Vecteur_Creux);


        procedure Initialiser (V : out T_Vecteur_Creux) is
        begin
                V := Null;
        end Initialiser;


	procedure Detruire (V: in out T_Vecteur_Creux) is
        begin
                if V = Null then
                        Null;
                else
                        --Liberation de l'espace memoire
                        Detruire(V.all.Suivant);
                        Free(V);
                end if;
	end Detruire;


	function Est_Nul (V : in T_Vecteur_Creux) return Boolean is
	begin
		return (V=Null);
	end Est_Nul;


	function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
        begin
                if V=Null or else V.all.Indice > Indice then-- ou alors
                        return 0.0;
                elsif V.all.Indice = Indice then
                        return V.all.Valeur;
                else
                        return Composante_Recursif(V.all.Suivant, Indice);
                end if;
        end Composante_Recursif;


        function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
                Vecteur_Restant: T_Vecteur_Creux;
	begin
                Vecteur_Restant := V;

                --On parcourt la liste jusqu'a ce qu'on ait dépassé l'indice cherché ou jusq'au bout
                while Vecteur_Restant /= Null loop
                        --Si on a trouvé la cellule cherchée: on retourne la valeur de cette cellule
                        if Vecteur_Restant.all.Indice = Indice then
                                return V.all.Valeur;
                        end if;--sinon on s'occupe du reste de la liste (de la queue)
                        Vecteur_Restant := Vecteur_Restant.all.Suivant;
                end loop;
                return 0.0;

        end Composante_Iteratif;


        procedure Modifier (V : in out T_Vecteur_Creux ;-- OOOOOOOK
                     Indice : in Integer ;
                     Valeur : in Float ) is
                Vecteur_Restant: T_Vecteur_Creux;
                Vecteur_Tmp: T_Vecteur_Creux;--Utile pour supprimer une cellule
        begin
                --Si on veut supprimer une cellule
                if Valeur=0.0 then
                        if V = Null then
                                Null;
                        elsif V.all.Indice = Indice then
                                Vecteur_Tmp := V.all.Suivant;
                                Free(V);
                                V := Vecteur_Tmp;
                        else--sinon V/= null et V.all.Indice /= Indice
                                Modifier(V.all.Suivant, Indice, Valeur);
                        end if;
                elsif V = Null then--Donc Valeur /=0.0
                        V := new T_Cellule'(Indice, Valeur, Null);
                else--Sinon V contient au moins 1 cellule
                        Vecteur_Restant := V;

                        --Parcourt
                        while (Vecteur_Restant.all.Suivant /= Null and then Vecteur_Restant.all.Suivant.all.Indice < Indice) loop
                                Vecteur_Restant := Vecteur_Restant.all.Suivant;
                        end loop;

                        --Si Vecteur_Restant.all.Suivant = Null;
                        if Vecteur_Restant.all.Suivant = Null then
                                Vecteur_Restant.all.Suivant := new T_Cellule'(Indice, Valeur, Null);
                        --Si la cellule d'indice Indice n'existe pas, et que la cellule précedente est aussi d'incide < Indice: on insère en tete
                        --correspond au cas où il faut insérer en tete de liste
                        elsif Vecteur_Restant.all.Indice > Indice then
                                V := new T_Cellule'(Indice, Valeur, V);
                        --Si la cellule d'indice Indice n'existe pas: On insère une cellule
                        elsif Vecteur_Restant.all.Suivant.all.Indice > Indice then
                                Vecteur_Restant.all.Suivant := new T_Cellule'(Indice, Valeur, Vecteur_Restant.all.Suivant);
                        --Si on a trouvé la bonne cellule
                        elsif Vecteur_Restant.all.Suivant.all.Indice = Indice then
                                Vecteur_Restant.all.Suivant.all.Valeur := Valeur;
                        else
                                null;
                        end if;
                end if;
	end Modifier;


	function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean is
        begin
                --Si la 1er cellule est identique sur V1 et V2: appel recursif
                if V1 = Null and V2 = Null then
                        return True;
                elsif V1.all.Indice = V2.all.Indice and V1.all.Valeur = V2.all.Valeur then
                        return Sont_Egaux_Recursif(V1.all.Suivant, V2.all.Suivant);
                else
                        return False;
                end if;
	end Sont_Egaux_Recursif;


	function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean is
	begin
		return False;	-- TODO : à changer
	end Sont_Egaux_Iteratif;


	procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in T_Vecteur_Creux) is
	begin
		Null;	-- TODO : à changer
	end Additionner;


	function Norme2 (V : in T_Vecteur_Creux) return Float is
	begin
		return 0.0;	-- TODO : à changer
	end Norme2;


	Function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float is
	begin
		return 0.0;	-- TODO : à changer
	end Produit_Scalaire;


	procedure Afficher (V : T_Vecteur_Creux) is
	begin
		if V = Null then
                        Put ("--E");
                        New_Line;
		else
			Put ("-->[ ");
			Put (V.all.Indice, 0);
			Put (" | ");
			Put (V.all.Valeur, Fore => 0, Aft => 1, Exp => 0);
			Put (" ]");
			Afficher (V.all.Suivant);
		end if;
	end Afficher;


	function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer is
	begin
		if V = Null then
			return 0;
		else
			return 1 + Nombre_Composantes_Non_Nulles (V.all.Suivant);
		end if;
	end Nombre_Composantes_Non_Nulles;


end Vecteurs_Creux;
