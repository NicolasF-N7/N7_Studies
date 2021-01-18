with Ada.Text_IO;use Ada.Text_IO;
with Ada.Command_Line;
use Ada;

procedure LRfifo is
  type Mode is (Lect, Ecr);

task Fichier is
  entry Demander(md : Mode);
  entry Terminer;
end Fichier;

task body Fichier is
  currentmd : Mode := Lect;
  nbuser : integer := 0;
begin
  loop
	select
		accept Demander(md : Mode) do
				if nbuser > 0 and currentmd /= md then
						while nbuser > 0 loop
								accept Terminer;
								nbuser := nbuser - 1;
						end loop;
						currentmd := md;				
                end if;                
                if nbuser > 0 and currentmd = Ecr and md = Ecr then
						accept Terminer;
						nbuser := nbuser - 1;
                end if;
		end Demander;
		nbuser := nbuser  + 1;
	or  
		accept Terminer; nbuser := nbuser - 1;
	or 
		terminate;
	end select;
  end loop;
end Fichier;
   
--spécification des tâches User   
task type User is
	entry Init(id : natural);
end User;

task body User is
idUser : natural;

begin
	accept Init(id: natural) do idUser:=id; end Init;
	-- à l'initialisation, le trains pairs partent vers E, les trains impairs vers O
	if (idUser mod 2 = 0) then
		Text_IO.Put_Line("User " & natural'image(idUser) & " attend pour Lect");
		Fichier.Demander(Lect);
		Text_IO.Put_Line("User " & natural'image(idUser) & " entre dans Lect");
		Fichier.Terminer;
		Text_IO.Put_Line("User " & natural'image(idUser) & " a termine");
	end if;
	loop
		Text_IO.Put_Line("User " & natural'image(idUser) & " attend pour Ecr");
		Fichier.Demander(Ecr);
		Text_IO.Put_Line("User " & natural'image(idUser) & " entre dans Ecr");
		delay 1.0;
		Fichier.Terminer;
		Text_IO.Put_Line("User " & natural'image(idUser) & " a termine");
		delay 1.0*idUser;
		Text_IO.Put_Line("User " & natural'image(idUser) & " attend pour Lect");
		Fichier.Demander(Lect);
		Text_IO.Put_Line("User " & natural'image(idUser) & " entre dans Lect");
		delay 1.0;
		Fichier.Terminer;
		Text_IO.Put_Line("User " & natural'image(idUser) & " a termine");
	end loop;
end User;

type Acces_user is access User;

--procédure principale
nb_user : natural;
aUser : Acces_user;
   
begin -- tâche VU lancée ici
	if Ada.Command_Line.Argument_Count /= 1 then
	  Text_IO.Put_Line("usage : conditions nbUser");
	  return;
	end if;

	nb_user := Natural'Value(Ada.Command_Line.Argument(1));

	for i in 1..nb_user loop
		--lancer une tâche Train
		aUser := new User;
		aUser.Init(i);
	end loop;
end LRfifo;

