with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version simple : exclusion mutuelle pour toutes les opérations
--  fournit une ossature pour l'approche "service"

package body LR.Synchro.serveurprioredac is
   
   function Nom_Strategie return String is
   begin
      return "Stratégie : serveurprioredac";
   end Nom_Strategie;

   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
    type Action is (Lecture, Redaction);
    act : Action := Lecture;
    nblect : integer := 0;
   begin
      loop
      	select
		    when (nblect = 0 and act /= Redaction) => 
				accept Demander_Ecriture; act := Redaction;
	        or
            when (act = Lecture and Demander_Ecriture'count = 0) =>
                accept Demander_Lecture; nblect := nblect + 1; act := Lecture;            
            or
		        accept Terminer_Lecture; nblect := nblect - 1;
            or
                accept Terminer_Ecriture; act := Lecture;
            or 
		        terminate;
	    end select;
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

end LR.Synchro.serveurprioredac;
