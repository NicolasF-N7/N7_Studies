function [X,Y] = vectorisation(I)
%VECTORISATION Summary of this function goes here
%   Detailed explanation goes here
G=I(:,1:1:end-1);
D=I(:,2:1:end);
X=G(:);
Y=D(:);
end

