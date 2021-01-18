%-------------------------------------------------------------------------%
% 1SN - TP Optimisation                                                   %
% INP Toulouse - ENSEEIHT                                                 %
%                                                                         %
% Fonction de calcul du residu de la fonction de Cobb-Douglas             %
%-------------------------------------------------------------------------%

function r = res_CD(beta)

    global Ki Li Yi

    % TO DO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    r = Yi - beta(1, 1).*(Ki.^beta(2,1)).*(Li.^(1-beta(2,1)));

end
