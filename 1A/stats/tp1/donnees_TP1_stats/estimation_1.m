function C_estime = estimation_1(x_donnees_bruitees,y_donnees_bruitees,C_tests,R_0)
%ESTIMATION_1 Summary of this function goes here
%   Detailed explanation goes here
C_X_tests = repmat(C_tests(:,1), 1, length(x_donnees_bruitees));
C_Y_tests = repmat(C_tests(:,2), 1, length(x_donnees_bruitees));
X_donnee=repmat(x_donnees_bruitees, length(C_X_tests), 1);
Y_donnee=repmat(y_donnees_bruitees, length(C_Y_tests), 1);

mat_dist_x_carre=(C_X_tests - X_donnee).^2;
mat_dist_y_carre=(C_Y_tests - Y_donnee).^2;

%taille 1000*50 (i,j)
mat_dist=sqrt(mat_dist_x_carre+mat_dist_y_carre);%distance = sqrt(x²+y²)
mat_erreur=mat_dist-R_0;

mat_sum_erreur_carree=sum(mat_erreur.^2,2);

[~, Ind_min_erreur] = min(mat_sum_erreur_carree);

C_estime=C_tests(Ind_min_erreur,:);
end

