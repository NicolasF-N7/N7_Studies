function [rho_F_1,theta_F_1] = RANSAC_2(rho,theta,parametres)
%RANSAC_2 Summary of this function goes here
%   Detailed explanation goes here
S1=parametres(1);
S2=parametres(2);
k_max=parametres(3);
n=length(rho);
residus_min=Inf;
modele_retenu=[0,0];

for k=1:k_max
    indices=randperm(n,2);
    
    
    rho_extrait=rho(indices);
    theta_extrait=theta(indices);
    
    [rho_F,theta_F, ~]=estimation_F(rho_extrait, theta_extrait);
    
    ecart_donnee_estimation=abs(rho-rho_F*cos(theta-theta_F));
    
    nbr_donnee_conformes=sum(ecart_donnee_estimation < S1);
    
    proportion_donnee_conformes=nbr_donnee_conformes/n;
    if proportion_donnee_conformes > S2
        ind_donnees_conformes=ecart_donnee_estimation < S1;
        [rho_F,theta_F, ecart_donnee_estimation]=estimation_F(rho(ind_donnees_conformes), theta(ind_donnees_conformes));
        
        residus=1/sum(ind_donnees_conformes)*sum(ecart_donnee_estimation);
        if residus_min > residus
            residus_min = residus;
            modele_retenu=[rho_F,theta_F];
        end
    end
    
end

rho_F_1=modele_retenu(1);
theta_F_1=modele_retenu(2);