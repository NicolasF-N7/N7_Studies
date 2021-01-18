with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;
with Vecteurs_Creux;    use Vecteurs_Creux;

-- Exemple d'utilisation des vecteurs creux.
procedure Exemple_Vecteurs_Creux is

        V : T_Vecteur_Creux;
        U : T_Vecteur_Creux;
begin
	Put_Line ("Début du scénario");
        Initialiser(V);
        Initialiser(U);

        Modifier(V, 8, 3.14);

        Modifier(V, 8, 0.1);

        Modifier(V, 2, 7.4);
        Afficher(V);

        -- U --
        Modifier(U, 8, 99.0);

        Modifier(U, 2, 3.14);

        Modifier(U, 6, 0.1);
        Afficher(U);

        Detruire(V);
        Detruire(U);
	Put_Line ("Fin du scénario");
end Exemple_Vecteurs_Creux;
