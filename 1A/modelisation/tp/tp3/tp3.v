Require Extraction.
Section induction.
Variable A : Set.
Inductive liste :Set :=
  Nil : liste
  | Cons : A -> liste -> liste.

Print liste_ind.
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
rewrite append_Cons.
rewrite IHl.
reflexivity.
Qed.


Theorem append_associative : forall (l1 l2 l3 : liste),
(append_spec l1 (append_spec l2 l3)) = 
(append_spec (append_spec l1 l2) l3).

induction l1.
intros.
rewrite append_Nil.
rewrite append_Nil.
reflexivity.
intros.
rewrite append_Cons.
rewrite append_Cons.
rewrite append_Cons.
rewrite IHl1.
reflexivity.
Qed.

Fixpoint append_impl (l1 l2 : liste) {struct l1} : liste :=
match l1 with
  Nil            => l2
  | (Cons t1 q1) => (Cons t1 (append_impl q1 l2))
end.

Theorem append_correctness : forall (l1 l2 : liste),
(append_spec l1 l2) = (append_impl l1 l2).

intros.
induction l1.
rewrite append_Nil.
simpl.
reflexivity.
rewrite append_Cons.
simpl.
rewrite IHl1.
reflexivity.
Qed.

Fixpoint rev_impl (l1 : liste) {struct l1} : liste :=
match l1 with
  Nil            => Nil
  | (Cons t1 q1) => append_impl (rev_impl q1) (Cons t1 Nil)
end.




(*
End Induction.
Extraction Language Ocaml.
Extraction "/tmp/induction" append_impl rev_impl.
Extraction Language Haskell.
Extraction "/tmp/induction" append_impl rev_impl.
Extraction Language Scheme.
Extraction "/tmp/induction" append_impl rev_impl.
*)