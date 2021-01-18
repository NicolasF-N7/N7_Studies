(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | mk_ref : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments mk_ref {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | mk_ref x => x
  end.

Parameter factorielle: Z -> Z.

Axiom factorielle_zero : ((factorielle 0%Z) = 1%Z).

Axiom factorielle_succ :
  forall (n:Z), (0%Z < n)%Z ->
  ((factorielle n) = (n * (factorielle (n - 1%Z)%Z))%Z).

Parameter n: Z.

Axiom H : (0%Z <= n)%Z.

Parameter r: Z.

Parameter i: Z.

Axiom H1 : (r = (factorielle i)).

Axiom H2 : (0%Z <= i)%Z.

Axiom H3 : (i <= n)%Z.

Axiom H4 : (i < n)%Z.

Parameter i1: Z.

Axiom H5 : (i1 = (i + 1%Z)%Z).

Parameter r1: Z.

Axiom H6 : (r1 = (i1 * r)%Z).

(* Why3 goal *)
Theorem VC_factorielle_ascendant :
  (r1 = (factorielle i1)) /\ ((0%Z <= i1)%Z /\ (i1 <= n)%Z).
Proof.
generalize H1 H2 H3 H4 H5 H6 factorielle_succ.

intros.

intuition.

rewrite H11.
rewrite H12.
rewrite H0.
rewrite H10.
cut (i+1-1=i)%Z.
intro.
rewrite H13.
omega.
omega.
rewrite H10.
omega.
Qed.
