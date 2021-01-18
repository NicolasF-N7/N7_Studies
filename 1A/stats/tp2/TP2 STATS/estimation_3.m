function [theta_estime,rho_estime] = estimation_3(x_donnees_bruitees,y_donnees_bruitees,theta_tests)
%ESTIMATION_3 Summary of this function goes here
%   Detailed explanation goes here
xg=mean(x_donnees_bruitees);
yg=mean(y_donnees_bruitees);

%x_mat=repmat(x_donnees_bruitees, length(theta_tests), 1);
%y_mat=repmat(y_donnees_bruitees, length(theta_tests), 1);

x_centree=x_donnees_bruitees-xg;
y_centree=y_donnees_bruitees-yg;

mat_x_cos=cos(theta_tests)*x_centree;
mat_y_sin=sin(theta_tests)*y_centree;

erreur=sum((mat_x_cos+mat_y_sin).^2, 2);
[~, ind_min_theta]=min(erreur);
theta_estime=theta_tests(ind_min_theta);
rho_estime=xg*cos(theta_estime) + yg*sin(theta_estime);
end

