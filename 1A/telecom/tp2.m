%% 3.2.1 Implantation de la chaine sur freequence porteuse
alpha = 0.35;
fp = 2000;
Fe = 10000;
Te = 1/Fe;
Rs = 1000;
Ts = 1/Rs;
Ns = 8; %Nombre d'échantillons par symboles / Facteur de suréchantillonnage
% 1
Nb_bits=1000;
N = Nb_bits * Ns;% Longueur du signal

bits=randi([0,1], 1, Nb_bits);%Information binaire
symboles_i = 2*bits - 1;%mapping {-1, +1} signal I
signal_i = kron(symboles_i, [1, zeros(1, Ns-1)]);

bits_q=randi([0,1], 1, Nb_bits);%Information binaire
symboles_q = 2*bits_q - 1;%mapping {-1, +1} signal Q
signal_q = kron(symboles_q, [1, zeros(1, Ns-1)]);

t = [0:Te: N*Te-Te];

subplot(2,1,1);
plot(t, signal_i, 'b-');
title("Signal en phase");
xlim([0, 20*Ts]);
ylim([-1.2 1.2]);

subplot(2,1,2);
plot(t, signal_q, 'b-');
title("Signal en quadrature de phase");
xlim([0, 20*Ts]);
ylim([-1.2 1.2]);

xe = signal_i + (signal_q).*j;
x = real(xe .* exp(j*2*pi*fp*t));

figure,
plot(t, x);
title("Signal sur fréquence porteuse");
xlim([0, 20*Ts]);
% 2 periodogramme
dsp = 1/length(x) * (abs(fftshift(fft(x))) .^2);
f = [-Fe/2 : Fe/N: Fe/2 - Fe/N];
figure,
plot(f, dsp);
title("DSP du signal sur porteuse");

%% 4.1
constellation_4ask = [-3 -1 1 3];
figure,
plot(constellation_4ask, 0, 'ro');
title("Constellation de la modulation 4-ASK");
xlim([-4 4]);

constellation_4psk = exp(j*2*pi/4 * [0:3])%1/sqrt(2) * [-1-j, -1+j, 1-j, 1+j];
figure,
axes();
plot(real(constellation_4psk), imag(constellation_4psk), 'ro');
title("Constellation de la modulation QPSK");
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
%axis([-1 1 -1 +1]);

constellation_8psk = exp(j*2*pi/8 * [0:7])%1/sqrt(2) * [-1-j, -1+j, 1-j, 1+j];
figure,
axes();
plot(real(constellation_8psk), imag(constellation_8psk), 'ro');
title("Constellation de la modulation 8-PSK");
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);

v = [-3 -1 1 3];
constellation_16qam = [v+3*j; v+j; v-j; v-3*j];
figure,
axes();
plot(constellation_16qam, 'ro');
title("Constellation de la modulation 16-QAM");
xlim([-5 5]);
ylim([-5 5]);


%% 4.2.1.1
alpha = 0.35;
fp = 2000;
Fe = 10000;
Te = 1/Fe;
Rs = 1000;
Ts = 1/Rs;
Ns = 8; %Nombre d'échantillons par symboles / Facteur de suréchantillonnage
Nb_bits=1000;
N = Nb_bits * Ns;% Longueur du signal
bits=randi([0,1], 1, Nb_bits);%Information binaire

h = rcosdesign(alpha, 8, Ns, 'sqrt');%le filtre SRRCF (=hr)
t0 = length(h);

% Chaine 4 ASK:
bits_groupes = reshape(bits, length(bits)/2, 2);% size:500 * 2

%Mapping
map_ind_00 = (bits_groupes(:,1) == 0) .* (bits_groupes(:,2) == 0);
map_ind_01 = (bits_groupes(:,1) == 0) .* (bits_groupes(:,2) == 1);
map_ind_10 = (bits_groupes(:,1) == 1) .* (bits_groupes(:,2) == 0);
map_ind_11 = (bits_groupes(:,1) == 1) .* (bits_groupes(:,2) == 1);

symboles_4ask = (-3)*map_ind_00 + (-1)*map_ind_01 + (1)* map_ind_10 + 3* map_ind_11;
suite_diracs_4ask = kron(symboles_4ask, [1, zeros(1, Ns-1)]);
%suite_diracs_4ask = suite_diracs_4ask';
%suite_diracs_4ask = suite_diracs_4ask(:);
x_4ask = filter(h,1,suite_diracs_4ask);
z_4ask = filter(h,1,x_4ask);
z_4ask = z_4ask';

%calcul TEB
signal_echantillone = z_4ask(1:Ns:end);
%symboles_decide = sign(signal_echantillone);%decision
symboles_decide = pamdemod(signal_echantillone, 4);%decision
bits_decide = (symboles_decide+1)/2;%Demapping
bits_utilise = bits(1:length(bits_decide));
nb_erreurs = length(find(bits_decide~=bits_utilise));
TEB = nb_erreurs/length(bits_utilise)


%Chaine QPSK
symboles_qpsk_I = 2*bits(1:2:end) - 1;
symboles_qpsk_Q = 2*bits(2:2:end-1) - 1;

peigne = zeros(1,Nb_bits/2*Ns);

x_qpsk = filter(h,1,peigne);
z_qpsk = filter(h,1,x_qpsk);

z_qpsk_ech = z_qpsk(1:Ns:end);

I = sign(real(z_qpsk_ech));
Q = sign(imag(z_qpsk_ech));

bit_est = zeros(1,Nb_bits);
bit_est(1:2:end) = I;
bit_est(2:2:end) = Q;

bit_est = (1-bit_est)/2;
TEB = mean(bit_est(t0:end-1) ~= bits(1:end-t0));


% symboles_qpsk = pskmod(bits, 4);
% suite_diracs_qpsk = kron(symboles_qpsk, [1, zeros(1, Ns-1)]);
% suite_diracs_qpsk(end:end + floor(length(h)/2)) = 0;%Rajout de 0 pour enlever le décalage du au filtre
% 
% x_qpsk = filter(h,1,suite_diracs_qpsk); x_qpsk(end:end + floor(length(h)/2)) = 0;
% z_qpsk = filter(h,1,x_qpsk);

%calcul TEB
signal_echantillone_qpsk = z_qpsk(t0:Ns:end-t0);
symboles_decide_qpsk = pskdemod(signal_echantillone_qpsk, 4);%decision
bits_decide_qpsk = (symboles_decide_qpsk+1)/2;%Demapping
bits_utilise_qpsk = bits(1:length(bits_decide_qpsk));
nb_erreurs = length(find(bits_decide_qpsk~=bits_utilise_qpsk));
TEB = nb_erreurs/length(bits_utilise_qpsk);

