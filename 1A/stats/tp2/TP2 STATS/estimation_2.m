function [a_estime,b_estime] = estimation_2(x_donnees_bruitees,y_donnees_bruitees)
%ESTIMATION_2 Summary of this function goes here
%   Detailed explanation goes here
A=repmat(x_donnees_bruitees, 2, 1);
A(2, :)=1;
A=A';
B=y_donnees_bruitees';

A_plus=inv(A'*A)*A';

X_solution=A_plus*B;

a_estime=X_solution(1,:);
b_estime=X_solution(2,:);

end

