x0 = [0 pi/4 0 0]';
K_tab=[0.6700   19.9055    1.0747    1.9614; 
    0.1*[0.6700   19.9055    1.0747    1.9614];
    10*[0.6700   19.9055    1.0747    1.9614];
    0.01*[0.6700   19.9055    1.0747    1.9614]];

for i=1:4
    K=K_tab(i,:);
    Out = sim(fich_simulink_etu,[t0 tf],options_sim);
    X   = Out.X;
    U   = Out.U;
    figure;
    plot(X.Time,U.Data);
end

function graphiques(x,u)
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