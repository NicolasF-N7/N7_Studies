Nb_bits=1000;
bits=randi([0,1], 1, Nb_bits);%Information binaire
symboles=2*bits - 1;%mapping


%% Implantation 2.2.2
Ns=10;%Nombre d'échantillons par symboles / Facteur de suréchantillonnage (Te = 1)
suite_diracs1=kron(symboles, [1, zeros(1, Ns-1)]);
h1=ones(1, Ns);
x1=filter(h1,1,suite_diracs1);

hr1=fliplr(h1);
z1=filter(hr1,1,x1);

plot([1:length(z1)], z1);
title("Signal en sortie du filtre de reception");
ylim([-15 15]);

figure,
axis([0  length(x1) -4.5 4.5])
oeil=reshape(z1, Ns, length(z1)/Ns);
plot(oeil);
title("Diagramme de l'oeil");

axis([1 Ns -Ns-1 Ns+1]);
signal_echantillone=z1(Ns:Ns:end);
symboles_decide=sign(signal_echantillone);
TES=length(find(symboles_decide~=symboles))/length(symboles)

bits_decide=(symboles_decide+1)/2;
TEB=length(find(bits_decide~=bits))/length(bits)
Px1=mean(abs(x1).^2);

%% 2.2.3 et 2.2.4 TEB=f(EB/N0)
N=300%nombre de points du graphe TEB=f(Eb/N0(db))
xmin=-30;
xmax=30;
TEB_tab=zeros(1,N);
TEB_theo=zeros(1,N);
abscisses=zeros(1,N);

for i=1:N
    Eb_N0_dB=i*xmax/N + xmin;
    abscisses(i)=Eb_N0_dB;
    
    sigma_n_carre=Px1*Ns/(2*log2(2)*10^(Eb_N0_dB/10));
    sigman=sqrt(sigma_n_carre);
    bruit=sigman*randn(1, length(x1));
    y=x1+bruit;
    z1=filter(hr1,1,y);
    signal_echantillone=z1(Ns:Ns:end);
    
    %calc TEB
    symboles_decide=sign(signal_echantillone);
    bits_decide=(symboles_decide+1)/2;
    TEB=length(find(bits_decide~=bits))/length(bits);
    TEB_tab(i)=TEB;
end
TEB_theo=1-normcdf(sqrt(2*10.^(abscisses/10)));% pour partie 2.2
%TEB_theo=1-normcdf(sqrt(10.^(abscisses/10)));%Pour partie 3.2

figure,
semilogy(abscisses, TEB_tab);
hold on,
semilogy(abscisses, TEB_theo, 'g');
legend("Courbe pratique", "Courbe théorique");


%% 3.2.1
Te=1;
Ns=10;%Ts=Ns*Te=Ns > 8
Ts=Ns;

bits=randi([0,1], 1, Nb_bits);
symboles=2*bits - 1;%mapping
suite_diracs2=kron(symboles, [1, zeros(1, Ns-1)]);

h2=ones(1,Ns);
hr2=zeros(1,Ns);
hr2(1:Ns/2)=1;

x2=filter(h2,1,suite_diracs2);
%h4Ts=[ones(1, 4/Ts) zeros(1, Ns- 4/Ts)];
%x=filter(h4Ts, 1, x);%filtrage à 4/Ts
z2=filter(hr2,1,x2);

%Affichage du signal en sortie
figure,
plot(z2, 'g');
ylim([-6 6]);
title("Signal filtré par hr");


%Traçage du diag de l'oeil
oeil=reshape(z2, Ns, length(z2)/Ns);
figure,
plot(oeil);
axis([1 Ns -Ns/2-1 Ns/2+1]);
title("Diagramme de l'oeil");

%Calcul TEB
signal_echantillone=z2(Ns:Ns:end);
symboles_decide=sign(signal_echantillone);

bits_decide=(symboles_decide+1)/2;
TEB=length(find(bits_decide~=bits))/length(bits)
%% 3.2.2+3 Teb=f(Eb/N0)
N=300%nombre de points du graphe TEB=f(Eb/N0(db))
Px2=mean(abs(x2).^2);
xmin=-30;
xmax=30;
TEB_tab=zeros(1,N);
TEB_theo=zeros(1,N);
abscisses=zeros(1,N);

for i=1:N
    Eb_N0_dB=i*xmax/N + xmin;
    abscisses(i)=Eb_N0_dB;
    
    sigma_n_carre=Px2*Ns/(2*log2(2)*10^(Eb_N0_dB/10));
    sigman=sqrt(sigma_n_carre);
    bruit=sigman*randn(1, length(x2));
    y2=x2+bruit;
    z2=filter(hr2,1,y2);
    signal_echantillone=z2(Ns:Ns:end);
    
    %calc TEB
    symboles_decide=sign(signal_echantillone);
    bits_decide=(symboles_decide+1)/2;
    TEB=length(find(bits_decide~=bits))/length(bits);
    TEB_tab(i)=TEB;
end
%TEB_theo=1-normcdf(sqrt(2*10.^(abscisses/10)));% pour partie 2.2
TEB_theo=1-normcdf(sqrt(10.^(abscisses/10)));%Pour partie 3.2

figure,
semilogy(abscisses, TEB_tab);
hold on,
semilogy(abscisses, TEB_theo, 'g');
legend("Courbe expérimentale", "Courbe théorique");

%% 3.2.4 comparaison effy en puissance

Pz2 = mean(abs(z2).^2);
eff = Pz2/Px2

Pz1 = mean(abs(z1).^2);
eff_chaine_ref = Pz1 / Px1
%Comparaison TEB = f(SNR/bit) pour la chaine de ref et la 2eme
%% 3.2.5 Comparaison Effy spectrale (DSP)
%On a le même debit binaire (Ns = 10) dans cette chaine et celle de
%reference
DSP_chaine_ref = 1/length(x1) * abs(fftshift(fft(x1))).^2;
DSP_chaine = 1/length(x2) * abs(fftshift(fft(x2))).^2;

figure,
plot([1:length(z1)], DSP_chaine_ref, 'r-');
hold on,
plot([1:length(z2)], DSP_chaine, 'g-');
xlabel("Temps");
ylabel("Amplitude du signal à la sortie du filtre de reception");
legend("DSP du signal transmis par la chaine de base", "DSP du signal transmis par la chaine 3");
%% 4.2.2 
%(Bande de base)
Fe = 12000;
Rs = 3000;
alpha = 0.5;
Ns = 16;%nb bit par symbol = 12000 / 3000 = Fe / Rs
suite_diracs3=kron(symboles, [1, zeros(1, Ns-1)]);

%4.2.2 b)
h3 = rcosdesign(alpha, 8, Ns, 'sqrt');%Filtre de mise en forme = hr3
suite_diracs3(end:end + floor(length(h3)/2)) = 0;%Rajout de 0 pour enlever le décalage du au filtre
x3 = filter(h3,1,suite_diracs3); x3(end:end + floor(length(h3)/2)) = 0;
z3 = filter(h3,1,x3);

figure,
plot(z3);
xlabel("Temps");
ylabel("Amplitude du signal à la sortie du filtre de reception");

%4.2.2 c) diag de l'oeil
oeil=reshape(z3, Ns, length(z3)/Ns);
figure,
plot(oeil);
title("Diagramme de l'oeil sans bruit");
axis([1 Ns+1 -Ns-1 Ns+1]);
ylim([-2 2]);

%Instant optimal d'ech: Ns = Ts = 16

%4.2.2 d) TEB nul

t0 = length(h3);
signal_echantillone = z3(t0:Ns:end-t0);%Prise en compte du retard introduit par les 2 filtrages
symboles_decide = sign(signal_echantillone);%decision
bits_decide = (symboles_decide+1)/2;%Demapping
bits_utilise = bits(1:length(bits_decide));
nb_erreurs = length(find(bits_decide~=bits_utilise));
TEB = nb_erreurs/length(bits_utilise)

%% 4.2.3-4
Px3=mean(abs(x3).^2);
N=300%nombre de points du graphe TEB=f(Eb/N0(db))
xmin=-30;
xmax=30;
TEB_tab=zeros(1,N);
TEB_theo=zeros(1,N);
abscisses=zeros(1,N);

for i=1:N
    Eb_N0_dB=i*xmax/N + xmin;
    abscisses(i)=Eb_N0_dB;
    
    sigma_n_carre=Px3*Ns/(2*log2(2)*10^(Eb_N0_dB/10));
    sigman=sqrt(sigma_n_carre);
    bruit=sigman*randn(1, length(x3));
    y3=x3+bruit;
    z3=filter(h3,1,y3);%ici hr = h
    signal_echantillone = z3(t0:Ns:end-t0);%retard pris en compte
    
    %calc TEB
    symboles_decide = sign(signal_echantillone);%decision
    bits_decide = (symboles_decide+1)/2;%Demapping
    bits_utilise = bits(1:length(bits_decide));
    nb_erreurs = length(find(bits_decide~=bits_utilise));
    TEB = nb_erreurs/length(bits_utilise)
    TEB_tab(i)=TEB;
end
TEB_theo=1-normcdf(sqrt(2*10.^(abscisses/10)));% pour partie 2.2
%TEB_theo=1-normcdf(sqrt(10.^(abscisses/10)));%Pour partie 3.2

figure,
semilogy(abscisses, TEB_tab);
hold on,
semilogy(abscisses, TEB_theo, 'g');
legend("Courbe expérimentale", "Courbe théorique");

%% 4.2.5 comp effy puissance
Pz3 = mean(abs(z3).^2);
eff_chaine4 = Pz3/Px3

eff_chaine_ref %affiche
%Effy de la chaine 4 de 23, encore plus faible que la précédente chaine. La
%chaine la plus efficace et celle de référence car les filtres utilisés
%sont très permissifs contrairement au racine de cos surrélevé.

%% 4.2.6 comp effy spectrale
DSP_chaine = 1/length(x3) * abs(fftshift(fft(x3))).^2;


figure,
plot([1:length(z1)], DSP_chaine_ref/abs(max(DSP_chaine_ref)), 'r-');
hold on,
plot(linspace(1,length(z1), length(z3)), DSP_chaine/abs(max(DSP_chaine)), 'g-');% pour supperposer les 2 graphiques: même lgr
legend("DSP du signal transmis par la chaine de base", "DSP du signal transmis par la chaine 4");

%La chaine étudiée est beaucoup plus efficace spectralement car elle
%utilise une plus petite bande de fréquence.[1::length(z1)]

%% 4.2.7

Te = 1e-4;
%params du filtre
n=30;
t_ordre61=[-n*Te:Te:n*Te];

fc_basse = 1500;
amplitude = abs(max(x3));
filtre_etroit = amplitude * sinc(t_ordre61*fc_basse);%f0 = 1 car Te = 1

fc_haute = 3000;
filtre_large = amplitude * sinc(t_ordre61*fc_haute);

y_etroit = conv(x3, filtre_etroit, 'same');
y_large = conv(x3, filtre_large, 'same');

z_etroit = filter(h3,1,y_etroit);
z_large = filter(h3,1,y_large);

oeil_etroit=reshape(z_etroit, Ns, length(z_etroit)/Ns);
figure,
plot(oeil_etroit);
axis([1 Ns -Ns/4-1 Ns/4+1]);
title("Diagramme de l'oeil avec canal de transmission = filtre PB 1500");

oeil_large=reshape(z_large, Ns, length(z_large)/Ns);
figure,
plot(oeil_large);
axis([1 Ns -Ns/4-1 Ns/4+1]);
title("Diagramme de l'oeil avec canal de transmission = filtre PB 3000");

%le diag de l'oeil filtré avec fc = 3000 a une hauteur plus petite

%% 5.2.1 Impact du choix du mapping
Te = 1;
Ts = Ns*Te;

bits_groupes = reshape(bits, length(bits)/2, 2);% size: 500 * 2

%Mapping
map_ind_00 = (bits_groupes(:,1) == 0) .* (bits_groupes(:,2) == 0);
map_ind_01 = (bits_groupes(:,1) == 0) .* (bits_groupes(:,2) == 1);
map_ind_10 = (bits_groupes(:,1) == 1) .* (bits_groupes(:,2) == 0);
map_ind_11 = (bits_groupes(:,1) == 1) .* (bits_groupes(:,2) == 1);

symboles4 = (-3)*map_ind_00 + (-1)*map_ind_01 + (1)* map_ind_10 + 3* map_ind_11;
suite_diracs4 = kron(symboles4, [1, zeros(1, Ns-1)]);

h4 = ones(1, Ns);
hr4 = ones(1, Ns);

%a)
x4 = filter(h4, 1, suite_diracs4);

figure,
plot(x4)
xlabel("Temps");
title("Signal en sortie du filtre d'émission");

DSP_x4 = 1/(length(x4)) * abs(fftshift(fft(x4))).^2;
figure,
plot(DSP_x4);
title("DSP du signal en sortie du filtre d'émission");

%b) effy spectrale
z4 = filter(hr4, 1, x4);
DSP_chaine5 = 1/length(z4) * abs(fftshift(fft(z4))).^2;

figure,
plot([1:length(z1)], DSP_chaine_ref / abs(max(DSP_chaine_ref)), 'r-');
hold on,
plot(linspace(1,length(z1), length(z4)), DSP_chaine5 / abs(max(DSP_chaine5)), 'g-');% pour supperposer les 2 graphiques: même lgr
xlabel("f");
legend("DSP du signal transmis par la chaine de base", "DSP du signal transmis par la chaine 5");
%même effy spectrale

%c)
oeil4 = reshape(z4(1:end-4, :), Ns, []);
figure,
plot(oeil4);
axis([1 Ns -Ns/4-1 Ns/4+1]);
title("Diagramme de l'oeil Quatrième chaine");

% little help: 
%DSP_binaire=10*log10(pwelch(signal_emis_binaire));
%plot(linspace(0,0.5,length(DSP_binaire)),DSP_binaire,'r')
%indices=find(sigReceptionEchant>0 && sigReceptionEchant < 16);