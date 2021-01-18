function [r_moy,v_moy] = moyenne(I)
%MOYENNE Summary of this function goes here
%   Detailed explanation goes here
%size(I) = n*m*3

maxi = max(sum(I, 3), [], 'all')
%maxi(maxi == 0) = 1;
I_norm = I ./ maxi;

r_moy = mean(I_norm(:,:,1), 'all');
v_moy = mean(I_norm(:,:,2), 'all');

end

