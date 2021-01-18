function [cos_theta_estime,sin_theta_estime,rho_estime] = estimation_4(x_donnees_bruitees,y_donnees_bruitees)
%ESTIMATION_4 Summary of this function goes here
%   Detailed explanation goes here
C(1,:)=x_donnees_bruitees;
C(2,:)=y_donnees_bruitees;

[V D]=eig(C'*C);
[min_vcp ind_min_vcp]=min(diag(D));
Y=V(ind_min_vcp);
cos_theta_estime=Y(1,1)/norm(Y);
sin_theta_estime=Y(2,1)/norm(Y);

rho_estime=x_donnees_bruitees(1)*cos_theta_estime + y_donnees_bruitees(1)*sin_theta_estime;
end

