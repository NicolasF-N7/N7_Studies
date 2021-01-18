with Arbre_Binaire;
with Ada.Text_IO; use Ada.Text_IO;

procedure test_arbre_binaire is
    
    package arbre_binaire_integer is
            new Arbre_Binaire(T_Element => Integer);
    use arbre_binaire_integer;
    
    AB : T_AB;
    id1 : Integer := 20;
    id2 : Integer := 35;
    id3 : Integer := 56;
    id4 : Integer := 72;
    
begin
    --Initialisation de l'arbre binaire.
    Initialiser_AB(AB,0); 
    put_line("L'arbre est initialisé");
    
    --Ajouter l'element id1.
    Ajouter_AB(AB, 0, id1);
    pragma Assert(Est_Present_AB(AB,id1));
    put_line("l'id1 est ajouté a l'arbre");
    
    -- Afficher l'arbre.
    --Afficher_AB(AB);
    
    --Ajouter l'element id2 et id3 a id1 et id4 a id2.
    Ajouter_AB(AB, id1, id2);
    Ajouter_AB(AB, id1, id3);
    Ajouter_AB(AB, id2, id4);
    put_line("id2, id3 et id4 sont ajoutés");
    
    --S'assurer que id2, id3 et id4 sont dans l'arbre.
    pragma Assert(Est_Present_AB(AB,id2));
    pragma Assert(Est_Present_AB(AB,id3));
    pragma Assert(Est_Present_AB(AB,id4));
    
    --Afficher l'arbre.
   -- Afficher_AB(AB);
    
    --Supprimer id4 et id1.
    Supprimer_AB(AB,id4);
    Supprimer_AB(AB,id1);
    put_line("id4 et id1 supprimés");
    --S'assurer qu'ils ne sont plus présents.
    pragma Assert(not(Est_Present_AB(AB,id4)));
    pragma Assert(not(Est_Present_AB(AB,id1)));
    pragma Assert(not(Est_Present_AB(AB,id2)));
    pragma Assert(not(Est_Present_AB(AB,id3)));
    pragma Assert(not(Est_Present_AB(AB,0)));
    pragma assert(Est_Vide_AB(AB));
    put_line("l'arbre est vide");
    
    -- Detruire l'arbre.
    Detruire_AB(AB);
    Put_line("l'arbre est detruit");
end test_arbre_binaire;