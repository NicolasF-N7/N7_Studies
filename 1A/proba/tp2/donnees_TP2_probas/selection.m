function [selection_frequences,selection_alphabet] = selection(frequences,alphabet)
%SELECTION Summary of this function goes here
%   Detailed explanation goes here
selection_frequences=frequences(find(frequences~=0));
selection_alphabet=alphabet(find(frequences>0));