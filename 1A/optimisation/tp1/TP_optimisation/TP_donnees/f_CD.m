function f = f_CD(beta)
%F_CD Summary of this function goes here
%   Detailed explanation goes here
rx=res_CD(beta);
f=1/2*rx'*rx;
end

