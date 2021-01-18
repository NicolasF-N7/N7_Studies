function freq = calcul_frequences(texte,alphabet)
%CALCUL_FREQUENCES Summary of this function goes here
%   Detailed explanation goes here
freq=zeros(1,length(alphabet));
for i=[1:length(alphabet)]
    freq(i)=length(find(texte==alphabet(i)));
end

freq=freq/length(texte);

end

