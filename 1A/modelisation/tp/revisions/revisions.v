(* Ouverture d’une section *)
Section CalculPropositionnel.
(* Les règles de la déduction naturelle doivent être ajoutées à Coq. *)
Require Import Naturelle.
(* Déclaration de variables propositionnelles *)
Variable A B C E Y R : Prop.

Theorem Thm_1 : ((A \/ B) -> C) -> (B -> C).