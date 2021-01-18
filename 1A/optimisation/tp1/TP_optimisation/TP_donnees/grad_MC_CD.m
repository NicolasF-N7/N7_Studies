%-------------------------------------------------------------------------%
% 1SN - TP Optimisation                                                   %
% INP Toulouse - ENSEEIHT                                                 %
%                                                                         %
% Fonction de calcul du gradient des moindres carres                      %
% de la fonction de Cobb-Douglas                                          %
%-------------------------------------------------------------------------%

function g = grad_MC_CD(beta)

    % TO DO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    gradJr=Jac_res_CD(beta);
    r=res_CD(beta);
    g = gradJr'*r;
    
end
