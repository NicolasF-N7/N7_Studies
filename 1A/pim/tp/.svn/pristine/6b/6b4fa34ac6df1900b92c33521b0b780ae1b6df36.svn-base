with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;
with Vecteurs_Creux;    use Vecteurs_Creux;


procedure Test_Vecteurs_Creux is


	procedure Initialiser (VC0, VC1, VC2 : in out T_Vecteur_Creux) is
	begin
		-- VC0 est un vecteur nul
                Initialiser (VC0);

		-- VC1 est un vecteur à deux composante
		Initialiser (VC1);
		Modifier (VC1, 10,  4.0);
                Modifier (VC1,  3, -3.0);
                Put ("VC1 = "); Afficher (VC1); New_Line;
                Put ("comp VC1 = "); Put(Composante_Recursif (VC1, 4)); New_Line;
                --pragma Assert (10.0 = Composante_Recursif (VC1, 4));

		Initialiser (VC2);
		Modifier (VC2,  100, 2.0);
		Modifier (VC2,    3, 3.0);
		Modifier (VC2,    1, 2.0);

		--Afficher les vecteurs
                Put ("VC0 = "); Afficher (VC0); New_Line;
                Put ("VC1 = "); Afficher (VC1); New_Line;
                Put ("VC2 = "); Afficher (VC2); New_Line;
                --pragma Assert (-3.0 = Composante_Recursif (VC1, 3));
	end;


	procedure Detruire (VC0, VC1, VC2 : in out T_Vecteur_Creux) is
	begin
		Detruire (VC0);
		Detruire (VC1);
		Detruire (VC2);
	end;


	procedure Tester_Nul is
		VC0, VC1, VC2: T_Vecteur_Creux;
        begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (Est_Nul (VC0));
		pragma Assert (not Est_Nul (VC1));
		pragma Assert (not Est_Nul (VC2));

		Detruire (VC0, VC1, VC2);
	end Tester_Nul;


	procedure Tester_Norme2 is
		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (0.0 = Norme2 (VC0));
		pragma Assert (25.0 = Norme2 (VC1));

		Detruire (VC0, VC1, VC2);
	end Tester_Norme2;


	type T_Fonction_Composante is
		access Function (VC : in T_Vecteur_Creux ; Indice : in Integer) return Float;
		--// Un pointeur sur un sous-programme permet de manipuler un
		--// sous-programme comme une donnée.

	Composante : constant T_Fonction_Composante := Composante_Recursif'Access;
		--// Composante est donc une constante qui pointe sur le sous-programme
		--// Composante_Recursif.


	procedure Tester_Composante(La_Composante : T_Fonction_Composante) is
		--// Remarque : On aurait pu arriver au même résultat en définissant un
		--// sous-programme générique.
		--// Voir Tester_Sont_Egaux pour une version générique.

		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert ( 0.0 = La_Composante (VC0, 1));

                pragma Assert ( 0.0 = La_Composante (VC1, 1));
		pragma Assert (-3.0 = La_Composante (VC1, 3));
		pragma Assert ( 0.0 = La_Composante (VC1, 4));
		pragma Assert ( 0.0 = La_Composante (VC1, 9));
		pragma Assert ( 4.0 = La_Composante (VC1, 10));
		pragma Assert ( 0.0 = La_Composante (VC1, 11));

		Detruire (VC0, VC1, VC2);
	end Tester_Composante;


	procedure Tester_Modifier is
		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));

		-- Changer des composantes non nulles
		-- * en première position
                Modifier (VC1, 3, 3.0);
                Afficher(VC1);
		pragma Assert (3.0 = Composante (VC1, 3));
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));

		-- * après la première
		Modifier (VC1, 10, 15.0);
		pragma Assert (15.0 = Composante (VC1, 10));
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));

		-- Ajouter au début
		Modifier (VC1, 1, 1.5);
		pragma Assert (1.5 = Composante (VC1, 1));
		pragma Assert (3 = Nombre_Composantes_Non_Nulles (VC1));

		-- Ajouter au milieu
		Modifier (VC1, 7, 7.5);
		pragma Assert (7.5 = Composante (VC1, 7));
		pragma Assert (4 = Nombre_Composantes_Non_Nulles (VC1));

		-- Ajouter à la fin.
		Modifier (VC1, 111, 0.5);
		pragma Assert (0.5 = Composante (VC1, 111));
		pragma Assert (5 = Nombre_Composantes_Non_Nulles (VC1));

		-- Mettre à 0.0 une composante existante
		-- * Au milieu
		Modifier (VC1, 10, 0.0);
		pragma Assert (0.0 = composante (VC1, 10));
		pragma Assert (4 = Nombre_Composantes_Non_Nulles (VC1));

		-- * À la fin
		Modifier (VC1, 111, 0.0);
		pragma Assert (0.0 =
