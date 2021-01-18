clear variables
close all

% chargement du jeu de donnes
load('dataset.mat')

[nb_indiv, nb_param] = size(X);

Xc= X-mean(X);
mat_covX = (1/nb_indiv)*(Xc'*Xc);% Matrice de variance/covariance
[V, D] = eig(mat_covX);%Calcul elements propres

[sorted_vap, I] = sort(diag(D), 'descend');%Tri selon valeur propre décroissante
%Ordonner V et D dans l'odre décroissant des vap
V = V(:,I);
diagD = diag(D);D = diag(diagD(I));
%Calc de X dans nv repère
C = Xc * V;

%Affichage du pourcentage d'information des composantes
pourcentage = diag(D) / sum(diag(D));
plot((1:nb_param), pourcentage, 'ro');

title('Pourcentage d info contenue sur chaque composante ppale -- 4 classes')
xlabel('num de la comp. ppale');ylabel('pourcentage d info');

%VISUALISATION
figure(2),clf, 
grid on
plot3(C(:,1),C(:,2), C(:,3), 'rx');
%plot3(X(1:n1,1),X(1:n1,2), X(1:n1,3), 'rx', X(n1+1:n1+n2,1), X(n1+1:n1+n2,2), X(n1+1:n1+n2,3), 'gx', X(n1+n2+1:n1+n2+n3,1), X(n1+n2+1:n1+n2+n3,2), X(n1+n2+1:n1+n2+n3,3), 'bx', X(n1+n2+n3+1:n,1), X(n1+n2+n3+1:n,2), X(n1+n2+n3+1:n,3), 'mx');
title('Proj. des donnees sur 3 1ers axes ppaux')

figure(3),clf, 
grid on
plot(C(:,4),C(:,5), 'rx');
%plot3(X(1:n1,1),X(1:n1,2), X(1:n1,3), 'rx', X(n1+1:n1+n2,1), X(n1+1:n1+n2,2), X(n1+1:n1+n2,3), 'gx', X(n1+n2+1:n1+n2+n3,1), X(n1+n2+1:n1+n2+n3,2), X(n1+n2+1:n1+n2+n3,3), 'bx', X(n1+n2+n3+1:n,1), X(n1+n2+n3+1:n,2), X(n1+n2+n3+1:n,3), 'mx');
title('Proj. des donnees sur 4,5 eme axes ppaux')

