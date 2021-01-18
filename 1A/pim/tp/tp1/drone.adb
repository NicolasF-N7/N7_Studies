with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

--R0: Ecrire le programme drone comme spécifié

procedure drone is
    Alt: Integer=0; -- L'altitude actuelle du drone
    Choix: Character; -- Le choix de l'utilisateur dans le menu parmis d,m,s,q
    Marche: Boolean=False; -- L'état de marche du drone: True=démarré ; False=Arreté
    Quitter: Boolean=False; -- Etat de marche du programme: si Quitter=True alors arret du programme
begin

    loop
	--Affcher menu
	Put_Line("Altitude: " & Integer'Image(Alt));
	New_Line;
	Put_Line();

    end loop

