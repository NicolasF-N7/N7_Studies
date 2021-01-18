with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version simple : exclusion mutuelle pour toutes les opérations
--  fournit une ossature pour l'approche "service"

package body LR.Synchro.serveur is
   
   function Nom_Strategie return String is
   begin
      return "Stratégie : serveur";
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
      	select
		    when (etat = Libre) => 
				accept Demander_Ecriture; etat := Red;
	        or
            when (etat = Lect or etat = Libre) =>
                accept Demander_Lecture; nblect := nblect + 1; etat := Lect;            
            or
		    when (etat = Lect) => 
                accept Terminer_Lecture; nblect := nblect - 1; if nblect = 0 then etat := Libre; end if;
            or
            when (etat = Red) =>
                accept Terminer_Ecriture; etat := Libre;
            or 
		        terminate;
	    end select;
        -- une fois une opération acceptée, on accepte uniquement sa terminaison
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

end LR.Synchro.serveur;
