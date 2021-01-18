Require Import Naturelle.
Section Session1_2018_Logique_Exercice_1.

Variable A B: Prop.

Theorem Exercice_1_Naturelle : ~(A \/ B) -> (~A /\ ~B).
Proof.
I_imp H.
I_et.
I_non nA.
E_non (A \/ B).
I_ou_g.
Hyp nA.
Hyp H.
I_non nB.
E_non (A \/ B).
I_ou_d.
Hyp nB.
Hyp H.
Qed.

Theorem Exercice_1_Coq : ~(A \/ B) -> (~A /\ ~B).
Proof.
intro H.
split.
unfold not.
intro H1.
absurd (A \/ B).
exact H.
left.
exact H1.
unfold not.
intro H1.
absurd (A \/ B).
exact H.
right.
exact H1.
Qed.

End Session1_2018_Logique_Exercice_1.
