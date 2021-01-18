Require Import Naturelle.
Section Session1_2019_Logique_Exercice_2.

Variable A B : Prop.

Theorem Exercice_2_Naturelle : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
I_imp H.
(* I_et. I_ou_d _g *)
I_ou_g.
E_ou (~A) B.
Hyp H.
I_imp H1.
Hyp H1.
I_imp H3.
E_ou

(*I_imp H.
I_ou_g.
E_ou (~A) B.
Hyp H.
I_imp H1.
Hyp H1.
I_imp H2.
I_non H1.
E_non A.
Hyp H1.
I_non H3.
E_non A.


E_ou (~A) B.
Hyp H.
I_imp H2.
I_ou_g.
Hyp H2.
I_imp H3.
I_ou_d.
I_et.



I_ou_g.
I_non H1.
E_non A.
Hyp H1.
E_ou A B.
I_ou_g.
Hyp H1.
I_imp H2.

Qed.*)

Theorem Exercice_2_Coq : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
intros.
right.
split.
destruct H.
absurd A.
exact H.

destruct H.
exact H.


Qed.

End Session1_2019_Logique_Exercice_2.

