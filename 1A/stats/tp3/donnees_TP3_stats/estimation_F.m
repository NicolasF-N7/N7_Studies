function [rho_F,theta_F, ecart_donnee_estimation] = estimation_F(rho, theta)
%ESTIMATION_F Summary of this function goes here
%   Detailed explanation goes here
A(:,1)=cos(theta);
A(:,2)=sin(theta);
B=rho;
X=pinv(A)*B;

rho_F=sqrt(X(1)^2+X(2)^2);
theta_F=atan2(X(2),X(1));


ecart_donnee_estimation=abs(rho-rho_F*cos(theta-theta_F));

end

