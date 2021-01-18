Variable phi psi chi E Y R : Prop.
Variables A B : Prop.

Theorem Coq_E_imp : ((phi -> psi) /\ phi) -> psi.
intro H.
destruct H as (HA,HB).
cut phi.
exact HA.
exact HB.

(*
cut phi.

cut ((phi->psi) /\ phi).
intro H.
elim H.
intros HB HC.
exact HB.
exact HA.

cut ((phi->psi) /\ phi).
intro H2.
elim H2.
intros HD HE.
exact HE.
exact HA.
Qed.*)