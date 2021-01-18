%-------------------------------------------------------------------------%
% 1SN - TP Optimisation                                                   %
% INP Toulouse - ENSEEIHT                                                 %
%                                                                         %
% Fonction de calcul de la Hessienne des moindres carres                  %
% de la fonction de Cobb-Douglas                                          %
%-------------------------------------------------------------------------%

function H = Hess_MC_CD(beta)

    global Ki Li

    % TO DO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    r=res_CD(beta);
    Jr=Jac_res_CD(beta);
    H=Jr'*Jr;
    
 
    v=log(Li./Ki).*(Ki.^beta(2,1)).*(Li.^(1-beta(2,1)));
    
    H(1,2)=H(1,2) + r'*v;
    H(2,1)=H(2,1) + r'*v;
    w=(log(Ki./Li)).^2.*(Ki.^beta(2,1)).*(Li.^(1-beta(2,1)));
    H(2,2)=r'*w;

end
