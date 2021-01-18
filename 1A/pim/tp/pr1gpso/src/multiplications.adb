--------------------------------------------------------------------------------
--  Auteur   : 
--  Objectif : 
--------------------------------------------------------------------------------

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Calendar;          use Ada.Calendar;
With Alea;

procedure Multiplications is
    Continuer: Boolean;
    Table: Integer;
    Erreur: Integer;
    N: Integer;
    Heure_Debut: Time;
    Heure_Fin: Time;
    Rep: Integer;
    Temps_Reponse: Duration;
    Temps_Reponse_Max: Duration;
    Table_Hesite: Integer;
    Temps_Reponse_Moyen: Duration;
    
    
    
    package Mon_Alea is
            new Alea(1, 10);-- générateur de nombre dans l'intervalle [5, 15]
    use Mon_Alea;
    
    
begin
    Continuer := True;
    while Continuer loop-- R1 boucle principale
        --R2 Demander quelle table réviser
        Put("Table à réviser?");
        Get(Table);
	while Table < 1 or Table > 10 loop
            Put("Table à réviser (Comprise entre 1 et 10)?");
            Get(Table);
	end loop;

	--R2 Faire réviser la table choisie
	Erreur := 0;
	for i in 1..10 loop
            --R3 Demander la réponse utilisateur
            Get_Random_Number(N);
            Put_Line("(M" & Integer'Image(i) & ") " & Integer'Image(Table) & " * " & Integer'Image(N) & " ? ");
            
            --R3 Traiter la réponser utilisateur
            --R4 Récup réponse et calc temps réponse
            Heure_Debut := Clock;
            Get(Rep);
            Heure_Fin := Clock;
            Temps_Reponse := Heure_Fin - Heure_Debut;
            
            --R4 Actu temps réponse max et table hésitation
            if Temps_Reponse > Temps_Reponse_Max then
                Temps_Reponse_Max := Temps_Reponse;
                Table_Hesite := N;
            end if;
            
            --R4 actu temps réponse moyen
            Temps_Reponse_Moyen := Temps_Reponse_Moyen + Temps_Reponse/10;
            
            --R4 Afficher message selon réponse
            if Rep /= Table*N then
                Put("Mauvaise réponse");
                Erreur := Erreur +1;
            else
                Put("Bravo !!!");
            end if;
        end loop;
        
        --R2 Afficher résultats finaux
        case Erreur is
            when 0 => Put("Aucune erreur. Excellent!!!");
            when 1 => Put("Une seule erreur. Très bien!");
            when 10 => Put("Tout est faux! Volontaire ??");
            when 2..4 => Put_Line(Integer'Image(Erreur) & " erreurs. Il faut encore retravailler la table de " & Integer'Image(Table) & ".");
            when 5..9 => Put_Line("Seulement " & Integer'Image(10-Erreur) & " bonnes réponses. Il faut apprendre la table de " & Integer'Image(Table) & ".");  
        end case;
        
        if Temps_Reponse_Max >= Temps_Reponse_Moyen +1 then
            Put_Line("Des hesitation sur la table " & Integer'Image(Table_Hesite) & ":"  & Duration'Image(Temps_Reponse_Max) & " secondes contre " & Duration'Image(Temps_Reponse_Moyen) & " en moyenne. Il faut certainement la réviser!");
        end if;
        
        --R2 Demander continuer ou quitter
        Put("On continue?(o/n)");
        Get(Rep);
        if Rep = 'n' or Rep = 'N' then
            Continuer := False;
        else
            Continuer := True;
        end if;
        

    end loop;
    null;
end Multiplications;
