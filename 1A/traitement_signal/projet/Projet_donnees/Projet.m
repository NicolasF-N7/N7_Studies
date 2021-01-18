clear all 
close all
clc

load donnees1.mat
load donnees2.mat

%% Paramètres globaux

% Changer fréquences porteuses? 

% Fréquence porteuse 1
Fp1=0;

% Fréquence porteuse 2
Fp2=46000;

% Période d'un timeslot
T=0.040;

% Fréquence et période d'échantillonnage
Fe=128000;
Te=1/Fe;

% Nombre de bits des variables bits_utilisateur
Nb=length(bits_utilisateur1);

% Nombre d'échantillons par niveau
Ns=T/(Nb*Te);

% durée d'un bit dans les signaux bits_utilisateur
Ts=Ns*Te;

% Nombre d'échantillons totaux
N=Ns*Nb;
Nx=5*N;

%9.3.2 Implantation

%% Modulation bande base

m1 = kron(2*bits_utilisateur1-1,ones(1,Ns));
m2 = kron(2*bits_utilisateur2-1,ones(1,Ns));


%Tracé des signaux de types NRZ m1 et m2 (figure 1 et 2)
figure; plot([0:Te:(N-1)*Te],m1)
ylim([-2,2]);
xlabel('temps en secondes')
ylabel('m1(t)')
title('figure 1a - m1(t)');
figure; plot([0:Te:(N-1)*Te],m2)
ylim([-2,2]);
xlabel('temps en secondes')
ylabel('m2(t)')
title('figure 1b - m2(t)');

% Tracé de la densité spectrale de puissance de m1 et m2
DSPm1=(1/N)*abs(fftshift(fft(m1))).^2;
DSPm2=(1/N)*abs(fftshift(fft(m2))).^2;
figure; plot([-Fe/2:Fe/N:Fe/2-Fe/N],DSPm1)
ylabel('DSP (m1)')
xlabel('Fréquence (Hz))')
title('figure 2a - DSP de m1 avec une fenêtre de Blackman');
figure; plot([-Fe/2:Fe/N:Fe/2-Fe/N],DSPm2)
ylabel('DSP (m2)')
xlabel('Fréquence (Hz)')
title('figure 2b - DSP de m2 avec une fenêtre de Blackman');

%% Construction du signal MF-TDMA

% Tracé du message NRZ pour m1 en utilisant le slot 2
t_x=[0:Te:(Nx-1)*Te];
Ym1=zeros(1,5*N);
Ym1(N+1:2*N)=m1;
figure; plot(t_x,Ym1)
ylabel('message NRZ généré pour m1')
xlabel('Temps (s)')
title('figure 3a - message NRZ généré pour m1')
ylim([-1.5,1.5])

% Tracé du message NRZ pour m2 en utilisant le slot 5
Ym2=zeros(1,5*N);
Ym2(4*N+1:5*N)=m2;
figure; plot(t_x,Ym2)
ylabel('message NRZ généré pour m2')
xlabel('Temps (s)')
title('figure 3b - message NRZ généré pour m2')
ylim([-1.5,1.5])

%% Modulation d'amplitude avec les fréquences des porteuses
x1=zeros(1,5*N);
x1(N+1:2*N)=m1.*cos(2*pi*Fp1*[0:Te:(N-1)*Te]);%cos(0)=1
x2=zeros(1,5*N);
x2(4*N+1:5*N)=m2.*cos(2*pi*Fp2*[0:Te:(N-1)*Te]);

figure; plot(t_x,x1)
ylabel('x1(t)')
xlabel('Temps (s)')
title('figure 4a - signal x1')
ylim([-1.5,1.5])
figure; plot(t_x,x2)
ylabel('x2(t)')
xlabel('Temps (s)')
title('figure 4b - signal x2')
ylim([-1.5,1.5])

%bruitage
X=fft(x1+x2);
autocorrel=ifft(X.*conj(X));
Ps=autocorrel(1);
SNR=100%en dB
sigma=sqrt(Ps*10^(-SNR/10));
x=sigma*randn(1,5*N) + (x1+x2);% LE signal MF-TDMA reçu
figure; plot(t_x,x)
ylabel('x(t)')
xlabel('Temps (s)')
title('figure 5 - signal MF-TDMA')
ylim([-1.5,1.5]);

% Densité spectrale du signal MF-TDMA
DSPx=(1/Nx)*abs(fftshift(fft(x))).^2;
figure;
f_x=[-Fe/2:Fe/Nx:Fe/2-Fe/Nx];
plot(f_x,DSPx);
ylabel('DSP (x)')
xlabel('Fréquence (Hz)')
title('figure 6 - DSP de x');

%% Mise en place du récepecteur MF-TDMA

% Synthèse du filtre passe-bas
ordre=30;
t_ordre=[-ordre*Te:Te:ordre*Te];
fc=20000;%30 kHz pour fréquence de coupure
f_ordre=[-Fe/2:Fe/(2*ordre+1):Fe/2-Fe/(2*ordre+1)];

%Traçage de la réponse impulsionnelle idéale
h1=2*fc/Fe*sinc(2*fc*t_ordre);
figure; plot(t_ordre,h1);
ylabel('Amplitude')
xlabel('temps (s)')
title('figure 7a - tracé de la réponse impulsionnelle idéale tronquée du filtre passe-bas');

%Traçage du filtre (rep en frequence)
H1 = abs(fftshift(fft(h1)));
figure; plot(f_ordre,H1)
ylabel('Amplitude')
xlabel(' fréquence (Hz)')
title('figure 7b - tracé de la réponse en fréquence du filtre passe-bas');

%traçage superposé de DSP et filtre
figure,
plot(f_x,DSPx/abs(max(DSPx)))% Normalisation des courbes
ylabel('DSP (x)')
xlabel('Fréquence (Hz)')
title('figure 8 - DSP de x');
hold on 
plot(f_ordre,H1/abs(max(H1)))
legend('DSP de x', 'réponse en fréquence du filtre passe bas');

%% Synthèse du filtre passe-haut
dirac=zeros(1, 2*ordre+1);
dirac(ordre+1)=1;
h2=dirac-h1;

figure; plot(t_ordre,h2);
ylabel('Réponse impulsionnelle idéale tronquée')
xlabel('temps (s)')
title('figure 9a - tracé de la réponse impulsionnelle idéale tronquée du filtre passe haut');

H2=abs(fftshift(fft(h2)));

figure; plot(f_ordre,H2)
ylabel('Réponse en fréquence')
xlabel(' fréquence (Hz)')
title('figure 9b - tracé de la réponse en fréquence du filtre passe haut');

figure; plot(f_x,DSPx/abs(max(DSPx)))
ylabel('DSP (x)')
xlabel('Fréquence (Hz)')
title('figure 10 - DSP de x et réponse en fréquence du filtre');
hold on 
plot(f_ordre,H2/abs(max(H2)))
legend('DSP de x', 'réponse en fréquence du filtre passe haut')

%% Filtrage du signal MF-TDMA
x1t=conv(x,h1,'same');%Convolution avec les Réponses impulsionnelles Idéales!!!
x2t=conv(x,h2,'same');

figure; plot(t_x,x1t)
ylabel('signal x1t')
xlabel('Temps(s)')
title('figure 11a - signal x1t');
figure;

plot(t_x,x2t)
ylabel('signal x2t')
xlabel('Temps(s)')
title('figure 11b - signal x2t');

%% Retour en bande base
bbx1=x1t.*cos(2*pi*Fp1*t_x);
bbx2=x2t.*cos(2*pi*Fp2*t_x);

bb1f=conv(bbx1,h1,'same');%on doit retrouver m1 et m2
bb2f=conv(bbx2,h1,'same');

figure; plot(t_x,bb1f)
ylabel('signal x1t bande base ')
xlabel('Temps(s)')
title('figure 12a - signal x1t retour en bande base');
figure;
plot(t_x,bb2f)
ylabel('signal x2t bande base')
xlabel('Temps(s)')
title('figure 12b - signal x2t retour en bande base');

%% Détection du slot utile
En1=[sum(bb1f(1:N).^2),sum(bb1f(N+1:2*N).^2),sum(bb1f(2*N+1:3*N).^2),sum(bb1f(3*N+1:4*N).^2),sum(bb1f(4*N+1:5*N).^2)];
En2=[sum(bb2f(1:N).^2),sum(bb2f(N+1:2*N).^2),sum(bb2f(2*N+1:3*N).^2),sum(bb2f(3*N+1:4*N).^2),sum(bb2f(4*N+1:5*N).^2)];
[~, IndMax1]=max(En1);
[~, IndMax2]=max(En2);

%Message 1
MessageRetrouve1=[bb1f((IndMax1-1)*N+1:IndMax1*N)];
SignalFiltre1=conv(MessageRetrouve1,ones(1,Ns),'same');
SignalEchantillonne1=SignalFiltre1(1:Ns:end);

BitsRecuperes1=(sign(SignalEchantillonne1)+1)/2;
messagestr1=bin2str((BitsRecuperes1));


%Message 2
MessageRetrouve2=[bb2f((IndMax2-1)*N+1:IndMax2*N)];
SignalFiltre2=conv(MessageRetrouve2,ones(1,Ns),'same');

SignalEchantillonne2=SignalFiltre2(1:Ns:end);
BitsRecuperes2=(sign(SignalEchantillonne2)+1)/2;
messagestr2=bin2str(BitsRecuperes2);