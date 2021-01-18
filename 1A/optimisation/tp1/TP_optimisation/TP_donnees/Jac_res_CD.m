%-------------------------------------------------------------------------%
% 1SN - TP Optimisation                                                   %
% INP Toulouse - ENSEEIHT                                                 %
%                                                                         %
% Fonction de calcul de la Jacobienne du residu                           %
% de la fonction de Cobb-Douglas                                          %
%-------------------------------------------------------------------------%

function Jres = Jac_res_CD(beta)
    global Ki Li

    % TO DO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Jres(:,1) = -(Ki.^beta(2,1)).*(Li.^(1-beta(2,1)));
    Jres(:,2) = beta(1, 1).*(Ki.^beta(2,1)).*(Li.^(1-beta(2,1))).*log(Li./Ki);

end
