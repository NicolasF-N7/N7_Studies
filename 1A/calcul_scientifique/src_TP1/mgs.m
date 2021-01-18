%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Calcul scientifique
% TP1 - Orthogonalisation de Gram-Schmidt
% mgs.m
%--------------------------------------------------------------------------

function Q = mgs(A)

    % Recuperation du nombre de colonnes de A
    [~, m] = size(A);
    
    % Initialisation de la matrice Q avec la matrice A
    Q = A;
    
    
    for i=1:m
        y=A(:,i);
        for j=1:(i-1)
            alpha=y'*Q(:,j);
            y=y-alpha*Q(:,j);
        end
        y=y/norm(y);
        Q(:,i)=y;
    end
    
end