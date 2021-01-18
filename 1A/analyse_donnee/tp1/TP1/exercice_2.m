%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP1 - Espace de représentation des couleurs
% Exercice_1.m
%--------------------------------------------------------------------------

clear
close all
clc

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

%% Décomposition des canaux RVB d'une image couleur

%I = imread('autumn.tif');          % 1er exemple
%I = imread('gantrycrane.png');    % 2nd exemple
I = imread('pears.png');          % 3ième exemple (dernier exercice)
%I = imread('coloredChips.png');   % 4ième exemple (dernier exercice)

% Découpage de l'image en trois canaux et conversion en flottants
Racp = single(I(:,:,1));
Vacp = single(I(:,:,2));
Bacp = single(I(:,:,3));

%% Affichage de l'image RVB et de ses canaux

% 1ère fenêtre d'affichage
figure('Name','Separation des canaux RVB',...
       'Position',[0.01*L,0.1*H,0.59*L,0.75*H])

% Affichage de l'image RVB
    subplot(2,2,1)	% La fenêtre comporte 2 lignes et 2 colonnes
    imagesc(I)
    axis off image
    title('Image RVB','FontSize',20)
    
colormap gray % Pour afficher les images en niveaux de gris
              % Affichage avec la palette 'parula' par défaut sinon
    
% Affichage du canal R
    subplot(2,2,2) % 1ère ligne, 2ème colonne
    imagesc(Racp)
    axis off image
    title('Canal R','FontSize',20)
    
% Affichage du canal V
    subplot(2,2,3) % 2ème ligne, 1ère colonne
    imagesc(Vacp)
    axis off image
    title('Canal V','FontSize',20)
    
% Affichage du canal B
    subplot(2,2,4) % 2ème ligne, 2ème colonne
    imagesc(Bacp)
    axis off image
    title('Canal B','FontSize',20)
    
% Enregistrement des images des canaux
imwrite(uint8(Racp),'canal_R.png')
imwrite(uint8(Vacp),'canal_V.png')
imwrite(uint8(Bacp),'canal_B.png')

%% Affichage du nuage de pixels dans le repère RVB

 % Deuxième fenêtre d'affichage
 figure('Name','Nuage de pixels dans le repere RVB',...
        'Position',[0.61*L,0.1*H,0.38*L,0.6*H])
 
     plot3(Racp,Vacp,Bacp,'b.')
     axis equal
     grid on
     xlabel('R','FontWeight','bold')
     ylabel('V','FontWeight','bold')
     zlabel('B','FontWeight','bold')
     title({'Représentation 3D des pixels' ...
            'dans l''espace RVB'},'FontSize',20)
     rotate3d 

%% Calcul des corrélations entre les canaux RVB et des contrastes
    
% Matrice des données
XACP = [Racp(:) Vacp(:) Bacp(:)];	% Les trois canaux sont vectorisés et concaténés
[N, ~] = size(XACP);
Xc= XACP-mean(XACP);


% Matrice de variance/covariance
sigma=(1/N)*(Xc'*Xc);

% Coefficients de corrélation linéaire
Var = diag(sigma);
ecart_type = sqrt(Var);

Rxy=sigma(2,1)/(ecart_type(1)*ecart_type(2));
Rxz=sigma(3,1)/(ecart_type(1)*ecart_type(3));
Ryz=sigma(3,2)/(ecart_type(2)*ecart_type(3));

% Proportions de contraste
cr=Var(1)/(sum(Var));
cv=Var(2)/(sum(Var));
cb=Var(3)/(sum(Var));


%% ACP

[W, D]= eig(sigma);
[vap Ind]=sort(diag(D), 'descend');
W=W(:, Ind);%on réarrange les vecteur propres aussi.

C=Xc*W;

XACP=reshape(C, size(I));
Racp = single(XACP(:,:,1));
Vacp = single(XACP(:,:,2));
Bacp = single(XACP(:,:,3));

%Affichage
% 1ère fenêtre d'affichage
figure('Name','resultat ACP',...
       'Position',[0.01*L,0.1*H,0.59*L,0.75*H])
colormap gray
% Affichage du canal R
    subplot(1,3,1) % 1ère ligne, 2ème colonne
    imagesc(Racp)
    axis off image
    title('Canal R','FontSize',20)
    
% Affichage du canal V
    subplot(1,3,2) % 2ème ligne, 1ère colonne
    imagesc(Vacp)
    axis off image
    title('Canal V','FontSize',20)
    
% Affichage du canal B
    subplot(1,3,3) % 2ème ligne, 2ème colonne
    imagesc(Bacp)
    axis off image
    title('Canal B','FontSize',20);
    
sigma=(1/N)*(C'*C);

% Coefficients de corrélation linéaire
Var = diag(sigma);
ecart_type = sqrt(Var);

Rxy=sigma(2,1)/(ecart_type(1)*ecart_type(2));
Rxz=sigma(3,1)/(ecart_type(1)*ecart_type(3));
Ryz=sigma(3,2)/(ecart_type(2)*ecart_type(3));

% Proportions de contraste
cx=Var(1)/(sum(Var));
cy=Var(2)/(sum(Var));
cz=Var(3)/(sum(Var));

    
%% EX 3


