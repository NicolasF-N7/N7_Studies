function [C_x,C_y,M] = matrice_inertie(Ex, Ey, G_norme_E)
%MATRICE_INERTIE Summary of this function goes here
%   Detailed explanation goes here
P=sum(G_norme_E);

C_x=1/P*(sum(G_norme_E.*Ex));
C_y=1/P*(sum(G_norme_E.*Ey));

M=zeros(2,2);

M(1,1)=1/P*sum(G_norme_E.*(Ex-C_x).^2);
M(2,2)=1/P*sum(G_norme_E.*(Ey-C_y).^2);
M(1,2)=1/P*sum(G_norme_E.*((Ey-C_y).*(Ex-C_x)));
M(2,1)=M(1,2);

end

