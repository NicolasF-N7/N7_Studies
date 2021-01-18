Section CalculPropositionnel.
Require Import Naturelle.
Variable phi psi chi E Y R : Prop.
Variables A B : Prop.
Theorem Thm00 : A /\ B -> B /\ A.
I_imp HAetB.
I_et.
E_et_d A.
Hyp HAetB.
E_et_g B.
Hyp HAetB.
Qed.

Theorem Thm_1 : ((phi \/ psi) -> chi) -> (psi -> chi).
I_imp H1.
I_imp H2.
E_imp (phi \/ psi).
Hyp H1.
I_ou_d.
Hyp H2.
Qed.

Theorem Thm_2 : phi -> ~~phi.
I_imp H1.
I_non H2.
E_non phi.
Hyp H1.
Hyp H2.
Qed.

Theorem Thm_3 : ((phi -> psi)) -> ((~psi -> ~phi)).
I_imp H1.
I_imp H2.
I_non H3.
E_non psi.
E_imp phi.
Hyp H1.
Hyp H3.
Hyp H2.
Qed.

Theorem Thm_4 : ~~phi -> phi.

I_imp H1.
absurde H2.
E_non (~phi).
Hyp H2.
Hyp H1.
Qed.
