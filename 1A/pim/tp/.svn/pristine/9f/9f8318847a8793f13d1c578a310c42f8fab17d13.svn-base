with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body ABR is

	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Noeud, Name => T_ABR);


	procedure Initialiser(Abr: out T_ABR) is
	begin
		Abr := Null;
	end Initialiser;


	function Est_Vide (Abr : T_Abr) return Boolean is
	begin
		return Abr = Null;	-- TODO : à changer
	end;


	function Taille (Abr : in T_ABR) return Integer is
        begin
                if Abr = Null then
                        return 0;
                else
                        return 1 + Taille(Abr.all.Sous_Arbre_Gauche) + Taille(Abr.all.Sous_Arbre_Droit);
                end if;
        end Taille;


	procedure Inserer (Abr : in out T_ABR ; Cle : in Character ; Donnee : in Integer) is
	begin
                if Abr = Null then
                        Abr := new T_Noeud'(Cle, Donnee, Null, Null);
                else
                        --Si la cle de la racine est plut petite que celle qu'on veut insérer: on insere à droite
                        if Abr.all.Cle < Cle then
                                Inserer(Abr.all.Sous_Arbre_Droit, Cle, Donnee);
                        elsif Abr.Cle > Cle then
                                Inserer(Abr.all.Sous_Arbre_Gauche, Cle, Donnee);
                        else
                                raise Cle_Presente_Exception;
                        end if;
                end if;

	end Inserer;


	procedure Modifier (Abr : in out T_ABR ; Cle : in Character ; Donnee : in Integer) is
	begin
                if Abr = Null then
                        raise Cle_Absente_Exception;
                else
                        if Abr.all.Cle < Cle then
                                Modifier(Abr.all.Sous_Arbre_Droit, Cle, Donnee);
                        elsif Abr.Cle > Cle then
                                Modifier(Abr.all.Sous_Arbre_Gauche, Cle, Donnee);
                        else
                                Abr.all.Donnee := Donnee;
                        end if;
                end if;
	end Modifier;


	function La_Donnee (Abr : in T_ABR ; Cle : in Character) return Integer is
	begin
		if Abr = Null then
                        raise Cle_Absente_Exception;
                else
                        if Abr.all.Cle < Cle then
                                return La_Donnee(Abr.all.Sous_Arbre_Droit, Cle);
                        elsif Abr.all.Cle > Cle then
                                return La_Donnee(Abr.all.Sous_Arbre_Gauche, Cle);
                        else
                                return Abr.all.Donnee;
                        end if;
                end if;
	end La_Donnee;


        procedure Supprimer (Abr : in out T_ABR ; Cle : in Character) is

                function Get_Min(Abr :in out T_ABR) return Character is
                begin
                        pragma assert(Abr /= Null);

                        if Abr.all.Sous_Arbre_Gauche = Null and Abr.all.Sous_Arbre_Droit = Null then
                                return Abr.all.Cle;
                        elsif Abr.all.Sous_Arbre_Gauche = Null then
                                return Abr.all.cle;
                        elsif Abr.all.Sous_Arbre_Droit = Null then
                                return Abr.all.Sous_Arbre_Gauche;
                        --Si le min se trouve à gauche
                        elsif Get_Min(Abr.all.Sous_Arbre_Gauche) < Get_Min(Abr.all.Sous_Arbre_Droit)then
                                return Get_Min(Abr.all.Sous_Arbre_Gauche);
                        else

                        end if;
                end Get_Min;

        begin
                ---TROUVER Noeud CLE

		if Abr = Null then
                        raise Cle_Absente_Exception;
                --Si abr est une feuille
                elsif Abr.all.Sous_Arbre_Gauche = Null and Abr.all.Sous_Arbre_Droit then
                        Abr := Null;
                --si abre possede uniquement un fils droit non nul
                elsif Abr.all.Sous_Arbre_Gauche = Null then
                        Abr.all.Sous_Arbre_Droit := Abr.all.Sous_Arbre_Droit.all.Sous_Arbre_Droit;
                --si abre possede uniquement un fils gauche non nul
                elsif Abr.all.Sous_Arbre_Droit = Null then
                        Abr.all.Sous_Arbre_Gauche := Abr.all.Sous_Arbre_Gauche.all.Sous_Arbre_Gauche;
                --si Abr possède deux fils non nuls
                else

                end if;
	end Supprimer;


	procedure Vider (Abr : in out T_ABR) is
	begin
                if Abr = Null then
                        Null;
                else
                        Vider(Abr.all.Sous_Arbre_Gauche);
                        Vider(Abr.all.Sous_Arbre_Droit);
                        Free(Abr);
                end if;
	end Vider;


	procedure Afficher (Abr : in T_ABR) is
	begin
                if Abr = Null then
                        Null;
                else
                        Afficher(Abr.all.Sous_Arbre_Gauche);
                        Put_Line("Cle: " & Character'Image(Abr.all.Cle) & ", Donnee: " & Integer'Image(Abr.all.Donnee));
                        Afficher(Abr.all.Sous_Arbre_Droit);
                end if;

	end Afficher;


	procedure Afficher_Debug (Abr : in T_ABR) is
	begin
		Null;	-- TODO : à changer
	end Afficher_Debug;

end ABR;
