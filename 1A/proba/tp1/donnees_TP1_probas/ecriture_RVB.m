function image_RVB = ecriture_RVB(img_originale)
%ECRITURE_RVB2 Summary of this function goes here
%   Detailed explanation goes here
[n,m]=size(img_originale);
image_RVB=zeros(n/2,m/2,3);

R=img_originale(1:2:end,2:2:end);
B=img_originale(2:2:end,1:2:end);
V1=img_originale(1:2:end,1:2:end);
V2=img_originale(2:2:end,2:2:end);

%Canal rouge
image_RVB(:,:,1)= R;
image_RVB(:,:,2)= 1/2*(V1+V2);
image_RVB(:,:,3)= B;

end