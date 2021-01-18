function x = moyenne(X)

R=single(X(:,:,1));
V=single(X(:,:,2));
B=single(X(:,:,3));

m=max(1, sum(X,3))
%X_normalise=single(X)./m;
r=R./m;
v=V./m;

r_moy=mean(r(:));
v_moy=mean(v(:));
x=[r_moy, v_moy];
end

