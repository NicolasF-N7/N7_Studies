function  graphiques(x,u)
% Réalise les graphiques des simulations issues de simulink
%
% parametres en entrée
% --------------------
% t : temps
%     real (N,1)
% x : état
%     real (N,n)
% u : contrôle
%     real (N,m)

subplot(2,1,1)
plot(x.Time,x.Data)
xlabel('t')
ylabel('états');
subplot(2,1,2)
plot(u.Time,u.Data)
xlabel('t')
ylabel('contrôle')

end

