with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version simple : exclusion mutuelle pour toutes les opérations
--  fournit une ossature pour l'approche "service"

package body LR.Synchro.automPrioRedac is
   
   function Nom_Strategie return String is
   begin
      return "Stratégie : automPrioRedac";
   end Nom_Strategie;

   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
    type EtatFichier is (Libre, Lect, Red);
    etat : EtatFichier := Libre;
    nblect : integer := 0;
   begin
      loop
      	case etat is
		    when Libre =>
                select
                    when (Demander_Ecriture'count = 0) =>
                        accept Demander_Lecture; nbLect := 1; etat := Lect;
			        or
				        accept Demander_Ecriture; nbLect := 0; etat := Red;
			    end select;
		    when Lect =>
			    select
                    when (Demander_Ecriture'count = 0) =>
				        accept Demander_Lecture; nbLect := nbLect + 1;
			        or
				        accept Terminer_Lecture; nbLect := nbLect - 1;
				        if nbLect = 0 then etat := Libre; end if;
			    end select;
		    when Red =>
			    select
				    accept Terminer_Ecriture; etat := Libre; 
			    end select;
	        end case;
      end loop;
   end LectRedTask;

   procedure Demander_Lecture is
   begin
      LectRedTask.Demander_Lecture;
   end Demander_Lecture;

   procedure Demander_Ecriture is
   begin
      LectRedTask.Demander_Ecriture;
   end Demander_Ecriture;

   procedure Terminer_Lecture is
   begin
      LectRedTask.Terminer_Lecture;
   end Terminer_Lecture;

   procedure Terminer_Ecriture is
   begin
      LectRedTask.Terminer_Ecriture;
   end Terminer_Ecriture;

end LR.Synchro.automPrioRedac;
