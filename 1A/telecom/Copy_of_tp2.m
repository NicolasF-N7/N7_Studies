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

bits_i=randi([0,1], 1, Nb_bits);%Information binaire
symboles_i = 2*bits_i - 1;%mapping {-1, +1} signal I
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
constellation_4ask = [-3 -2 -1 0 1 2 3];
figure,
plot(constellation_4ask, 0, 'r.');
title("Constellation de la modulation 4-ASK");

