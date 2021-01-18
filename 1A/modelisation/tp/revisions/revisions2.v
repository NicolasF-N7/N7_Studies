(* Ouverture d’une section *)Section CalculPredicats.
(* Définition de 2 domaines pour les prédicats *)
Variable A B : Type.

Theorem Thm_8 : forall (P Q : A -> Prop),
(forall x1 : A, (P x1) /\ (Q x1))-> 
(forall x2 : A, (P x2)) /\ (forall x3 : A, (Q x3)).

intro H.
intro H1.
intro H2.
split.
intro.
apply (H2 x2).
intro.
apply(H2 x3).
Qed.

Theorem Thm_9 : forall (P : A -> B -> Prop),
(exists x1 : A, forall y1 : B, (P x1 y1))->
forall y2 : B, exists x2 : A, (P x2 y2).

intros.
destruct H as (x1, H2).
exists x1.
apply (H2 y2).
Qed.

Theorem Thm_10 : forall (P Q : A -> Prop),
(exists x1 : A, (P x1) -> (Q x1))-> 
(forall x2 : A, (P x2))  ->  exists x3 : A, (Q x3).

intros.
destruct H.
exists x.
cut (P x).
exact H.
apply (H0, x).
Qed.
End CalculPredicats.



