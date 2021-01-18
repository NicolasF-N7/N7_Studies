function [r,a,b] = calcul_parametres(X,Y)
%CALCUL_PARAMETRES Summary of this function goes here
%   Detailed explanation goes here
moyX=sum(X)/length(X);
moyY=sum(Y)/length(Y);

Xcentre=X-moyX;
Ycentre=Y-moyY;

varX=sum(Xcentre.^2)/length(Xcentre);
varY=(sum(Y.^2))/length(Y)-moyY^2;

covXY=Xcentre'*Ycentre/length(X);

r=covXY/(sqrt(varX*varY));
a=covXY/varX;
b=moyY - a*moyX;
end

