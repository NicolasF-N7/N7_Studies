clear all;
close all;
clc;

%% Modulation
Fe=1000;
Te=1/Fe;
f0=200;
Nb=128;
bits=randi([0,1],1,Nb);

Ns=20;
Ts=Ns*Te;%Duree de transmission de 1 bit
N=Nb*Ns%longueur du tableau m

m=kron(2*bits-1,ones(1,Ns));
%Affichage de m
t=linspace(0, Nb*Ts,N);%Nb*Ns=length(m)
subplot(3,1,1);
plot(t,m, 'r-');
xlabel("Temps (s)");
ylabel("");
ylim([-1.5,1.5]);
title("Signal m (Figure 1)");

%Calcul FFT(m)
M=abs(fftshift(fft(m)));

%Affichage de M
%f=linspace(-Fe/2, Fe/2,N);%Nb*Ns=length(m)
f=[-Fe/2:Fe/N:Fe/2-Fe/N];
subplot(3,1,2);
plot(f,M, 'r-');
xlabel("Frequences (Hz)");
ylabel("");
title("Signal FFT(m) (Figure 2)");

%Transposition de frequence
tps=[0:Te:(N-1)*Te];
modulation=cos(2*pi*f0*tps);% echantillon
m_module=m.*modulation;

%Affichage de m modulé
M_module=abs(fftshift(fft(m_module)));
subplot(3,1,3);
plot(f,M_module, 'b-');
xlabel("Frequences (Hz)");
ylabel("");
title("Signal FFT(m modulé) (Figure 3)");



%% Demodulation
m2=m_module.*modulation;
M2=abs(fftshift(fft(m2)));

%Affichage
f=[-Fe/2:Fe/N:Fe/2-Fe/N];

figure,
plot(f,M2, 'g-');
xlabel("Frequences (Hz)");
title("Signal FFT(m modulé 2 fois) (Figure 4)");


%% Filtrage
% 8.4.3 a) Calcul de la reponse impulsionnelle ideale tronquée
n=30;
t_ordre61=[-n*Te:Te:n*Te];
RII=f0*sinc(t_ordre61*f0);

% Affichage
figure,
plot(t_ordre61,RII, 'g-');
xlabel("Temps (s)");
title("Reponse impulsionnelle idéale (Figure 5)");
ylim([-0.5,1.5]);

%% 8.4.3 b) Affichage du filtre en fréquence (de la porte)
%f=linspace(-Fe/2, Fe/2,length(RII));
f=[-Fe/2:Fe/length(RII):Fe/2-Fe/length(RII)];
figure,
plot(f,abs(fftshift(fft(RII))), 'g-');
xlabel("Frequences (Hz)");
title("FFT de la RII (Figure 6)");

%% 8.4.3 c) Comparaison des réponses impulsionnelles avec des ordres différents

%Calcul des RII
n_O21=10;% Ordre 21
n_O61=30;%Ordre 61

t_ordre21=[-n_O21*Te:Te:n_O21*Te];
f_O21=[-Fe/2:Fe/(2*n_O21+1):Fe/2-Fe/(2*n_O21+1)];
RII_O21=f0*sinc(t_ordre21*f0);

t_ordre61=[-n_O61*Te:Te:n_O61*Te];
f_O61=[-Fe/2:Fe/(2*n_O61+1):Fe/2-Fe/(2*n_O61+1)];
RII_O61=f0*sinc(t_ordre61*f0);

%affichage des Rii
figure,
plot(t_ordre21,RII_O21, 'rO');
xlim([-n_O61*Te, n_O61*Te]);
hold on;
%figure,
plot(t_ordre61,RII_O61, 'g-');
legend("Ordre21", "Ordre 61");
xlabel("Temps (s)");
title("Comparaison de RII (Figure 7)");

% Affichage des fft des rii
figure,
plot(f_O21,abs(fftshift(fft(RII_O21))), 'r-');
hold on;

plot(f_O61,abs(fftshift(fft(RII_O61))), 'g-');
legend("Ordre21", "Ordre 61");
xlabel("Frequences (Hz)");
title("Comparaison de FFT des RII (Figure 8)");

%% 8.4.3 d)
%on garde Ordre=61
RII_rect=f0*sinc(t_ordre61*f0);
RII_blackman=f0*sinc(t_ordre61*f0).*blackman(length(t_ordre61))';
f=[-Fe/2:Fe/length(RII_rect):Fe/2-Fe/length(RII_rect)];

figure,
plot(f,RII_rect, 'g-');
hold on;

plot(f,RII_blackman, 'r-');
legend("Avec fenetre rectangulaire", "Avec fenetre de blackman");
xlabel("Frequences (Hz)");
title("Comparaison des RI avec des fenetres differentes (Figure 9)");

fenetre_rect_o61=abs(fftshift(fft(RII_rect)));
figure,
plot(f,fenetre_rect_o61, 'g-');
hold on;

fenetre_blackman_o61=abs(fftshift(fft(RII_blackman)));
plot(f,fenetre_blackman_o61, 'r-');
legend("Avec fenetre rectangulaire", "Avec fenetre de blackman");
xlabel("Frequences (Hz)");
title("Comparaison des FFT des RI avec des fenetres differentes (Figure 10)");

%% 8.4.3 e)
%Ordre 61, fenetre blackman
f=[-Fe/2:Fe/N:Fe/2-Fe/N];

figure,
plot(f,M2, 'g-');
hold on;
plot(f_O61, fenetre_blackman_o61, 'r-');
legend("TF du signal modulé en sortie du cos de reception", "Filtre avec fenetre de Blackman, ordre 61");
xlabel("Frequences (Hz)");
title("Superposition du filtre et du signal à filtrer (Figure 11)");

%% 8.4.3 f) et g)
%Filtrage
signal_filtre=conv(m2, fenetre_blackman_o61, 'same');

figure,
plot(t, signal_filtre/abs(max(signal_filtre)), 'b-');
hold on;
plot(t,m, 'r-');
legend("Signal filtré", "Signal original");
xlabel("Temps");
title("Comparaison ds signaux (Figure 12)");
