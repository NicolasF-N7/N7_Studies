(* Ouverture d’une section *)
Section CalculPredicats.
(* Définition de 2 domaines pour les prédicats *)
Variable A B : Type.
(* Formule du second ordre : Quantification des prédicats phi et psi *)
Theorem Thm_8 : forall (phi psi : A -> Prop),
(forall x : A, (phi x) /\ (psi x))
->(forall x : A, (phi x)) /\ (forall x : A, (psi x)).

intro Hphi.
intro Hpsi.
intro HC.
split.
intro.
apply (HC x).
intro.
apply (HC x).
Qed.

(* Formule du second ordre : Quantification du prédicat phi *)
Theorem Thm_9 : forall (phi : A -> B -> Prop),
(exists x : A, forall y : B, (phi x y))->  
forall y : B, exists x : A, (phi x y).

intro Hphi.
intro HA.
intro y.
destruct HA.
exists x.
apply (H y).
Qed.

(* Formule du second ordre : Quantification des prédicats phi et psi *)
Theorem Thm_10 : forall (P Q : A -> Prop),
(exists x1 : A, (P x1) -> (Q x1))-> 
(forall x2 : A, (P x2))  ->  exists x3 : A, (Q x3).

intro P.
intro Q.
intro HA.
intro HB.
destruct HA.
exists x.
intro x2.
