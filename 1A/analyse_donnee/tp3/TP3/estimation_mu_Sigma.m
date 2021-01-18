function [mu,sigma] = estimation_mu_Sigma(X)
%X: matrice de données (taille n*2)
n=size(X,1);
uns=ones(n,1);
mu=1/n*X'*uns;

Xc=X-mean(X);
sigma = 1/n*Xc'*Xc;
end

