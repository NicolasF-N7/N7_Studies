function [a_estime,b_estime] = estimation_1(x_donnees_bruitees,y_donnees_bruitees,psi_tests)
%ESTIMATION_1 Summary of this function goes here
%   Detailed explanation goes here

%calcul du centre de gravité:
Xg=mean(x_donnees_bruitees);
Yg=mean(y_donnees_bruitees);

x_donnees_bruitees_centree = x_donnees_bruitees-Xg;
y_donnees_bruitees_centree = y_donnees_bruitees-Yg;

y_donnees_bruitees_centree_mat=repmat(y_donnees_bruitees_centree, length(psi_tests), 1);
erreur=sum((y_donnees_bruitees_centree_mat-tan(psi_tests)*x_donnees_bruitees).^2, 2);
[~, ind_min_erreur]=min(erreur);

a_estime=tan(psi_tests(ind_min_erreur));
b_estime=Yg-a_estime*Xg;

end

