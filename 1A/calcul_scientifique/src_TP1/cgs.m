%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Calcul scientifique
% TP1 - Orthogonalisation de Gram-Schmidt
% cgs.m
%--------------------------------------------------------------------------

function Q = cgs(A)

    % Recuperation du nombre de colonnes de A
    [~, m] = size(A);
    
    % Initialisation de la matrice Q avec la matrice A
    Q = A;
    
    for i=1:m
        a=A(:,i);
        alpha=Q(:,1:i-1)'*a;
        a=a-Q(:,1:i-1)*alpha;
        Q(:,i)=a/norm(a);
    end

end