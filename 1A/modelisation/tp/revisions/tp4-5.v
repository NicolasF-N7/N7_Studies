(* Bibliothèque pour l’extraction de programme. *)
Require Extraction. (* Ouverture d’une section *)
Section Induction. (* Déclaration d’un domaine pour les éléments des listes *)
Variable A : Set.

Inductive liste : Set :=
Nil    : liste
| Cons : A -> liste -> liste.

(* Déclaration du nom de la fonction *)
Variable append_spec : liste -> liste -> liste.
(* Spécification du comportement pour Nil *)
Axiom append_Nil : forall (l : liste), append_spec Nil l = l.
(* Spécification du comportement pour Cons *)
Axiom append_Cons : forall (t : A), forall (q l : liste),
  append_spec (Cons t q) l = Cons t (append_spec q l).

Theorem append_Nil_right : forall (l : liste), (append_spec l Nil) = l.
induction l.
apply (append_Nil Nil).
rewrite -> append_Cons.
rewrite IHl.
reflexivity.
Qed.


Theorem append_associative : forall (l1 l2 l3 : liste),(append_spec l1 
(append_spec l2 l3)) = (append_spec (append_spec l1 l2) l3).

induction l1.
intros.
rewrite append_Nil.
rewrite -> append_Nil.
reflexivity.
intros.
rewrite append_Cons.
rewrite append_Cons.
rewrite append_Cons.
rewrite IHl1.
reflexivity.
Qed.


