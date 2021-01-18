%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP3 - Classification bayésienne
% exercice_3.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des données de l'exercice 2
load resultats_ex2

%% Classifieur par maximum de vraisemblance
% code_classe est la matrice contenant des 1 pour les chrysanthemes
%                                          2 pour les oeillets
%                                          3 pour les pensees
% l'attribution de 1,2 ou 3 correspond au maximum des trois vraisemblances

images=[X_pensees; X_oeillets; X_chrysanthemes];

[mu1, sigma1]=estimation_mu_Sigma(X_pensees);
[mu2, sigma2]=estimation_mu_Sigma(X_oeillets);
[mu3, sigma3]=estimation_mu_Sigma(X_chrysanthemes);

code_classe=zeros(101);

for i=1:101
    for j=1:101
        X=[i,j]/101;
    
        vblc=zeros(3,1);
        vblc(1)=V_pensees(i,j);
        vblc(2)=V_oeillets(i,j);
        vblc(3)=V_chrysanthemes(i,j);
        
        [m, I]=max(vblc);
        I
        code_classe(i,j)=I;
    end
end




%% Affichage des classes

figure('Name','Classification par maximum de vraisemblance',...
       'Position',[0.25*L,0.1*H,0.5*L,0.8*H])
axis equal ij
axis([r(1) r(end) v(1) v(end)]);
hold on
imagesc(r,v,code_classe)
carte_couleurs = [.45 .45 .65 ; .45 .65 .45 ; .65 .45 .45];
colormap(carte_couleurs)
hx = xlabel('$\overline{r}$','FontSize',20);
set(hx,'Interpreter','Latex')
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex')
view(-90,90)

%% Comptage des images correctement classees
