%5.2
%Q1
N=90
f0=1100;%frequence du signal cosinus
Fe=10000;%frequence d'echantillonage
Te=1/Fe;
t=[0:Te:(N-1)*Te];%echelle des temps (abscisses)
x=cos(2*pi*f0*t);% echantillon d'un cos de freq 1100Hz ech a 10000 Hz

%Q2
figure,
plot(t,x);
title("(Figure 1) Cosinus de 1100 hz echantillioné a 10000 hz");
xlabel("Temps (secondes)");
ylabel("Amplitude (V)");

%Q3
Fe2=1000;%frequence d'echantillonage
Te2=1/Fe2;
x2=cos(2*pi*f0*(0:Te2:(N-1)*Te2));% echantillon
t2=[0:Te2:(N-1)*Te2];

figure,
plot(t2,x2);
title("(Figure 2) Cosinus de 1100 hz echantillioné a 1000 hz");
xlabel("Temps (secondes)");
ylabel("Amplitude (V)");

%5.3
%Q5.3.2 a)
X=abs(fft(x));% FFT de x
f=[0:Fe/N:(Fe-Fe/N)];

figure,
semilogy(f,X);
title("(Figure 3) FFT d'un cosinus de 1100 hz echantillioné a 10000 hz");
xlabel("Frequence (Hz)");
ylabel("Amplitude");

%Q5.3.2 b)
X2=abs(fft(x2));% FFT de x2
f2=[0:Fe2/N:(Fe2-Fe2/N)];

figure,
semilogy(f2,X2);
title("(Figure 4) FFT d'un cosinus de 1100 hz echantillioné a 1000 hz");
xlabel("Frequence (Hz)");
ylabel("Amplitude");

%Zerro padding
%Q6 = Q5.3.4
Np = 2^nextpow2(length(x));
y=x;
y(N:Np)=0;
Y=abs(fft(y));
fp=[0:Fe/Np:(Fe-Fe/Np)];

figure,
semilogy(fp,Y);
title("(Figure 5) FFT d'un cosinus de 1100 hz echantillioné a 10000 hz avec zero-padding");
xlabel("Frequence (Hz)");
ylabel("Amplitude");

%% Q7 = Q5.3.5
NpTab = [2^(nextpow2(length(x))), 2^(nextpow2(length(x))+2), 2^(nextpow2(length(x))+4)];
y1=x;
y2=x;
y3=x;

y1(N:NpTab(1))=0;
Y1=abs(fft(y1));
fp1=[0:Fe/NpTab(1):(Fe-Fe/NpTab(1))];

y2(N:NpTab(2))=0;
Y2=abs(fft(y2));
fp2=[0:Fe/NpTab(2):(Fe-Fe/NpTab(2))];

y3(N:NpTab(3))=0;
Y3=abs(fft(y3));
fp3=[0:Fe/NpTab(3):(Fe-Fe/NpTab(3))];

figure,
semilogy(fp1,Y1, 'r');

title("(Figure 6) FFT d'un cosinus de 1100 hz echantillioné a 10000 hz avec differents zero-padding");
xlabel("Frequence (Hz)");
ylabel("Amplitude");
hold on;
semilogy(fp2,Y2,'g');
hold on;
semilogy(fp3,Y3,'b');
legend("Zero-padding avec " + NpTab(1) + " points", "Avec " + NpTab(2) + " points", "Avec " + NpTab(3) + " points");

%% 5.4.2
x=cos(2*pi*f0*(1:N)*Te + 2*pi*rand);

%calcul du periodogramme:
dsp=(1/N)*abs(fft(x)).^2;
f=[0:Fe/N:Fe-Fe/N];

figure,
plot(f, dsp);
title("(Figure 7) DSP d'un cosinus à phase aléatoire");
xlabel("Indices");
ylabel("Amplitude");

%% 5.4.3

dsp_hamming=1/N*(abs(fft(x.*hamming(N)'))).^2;
dsp_blackman=1/N*(abs(fft(x.*blackman(N)'))).^2;

%Affichage
figure,
plot(f, dsp_hamming);
title("(Figure 8) DSP avec fenetres de hamming et blackman");
xlabel("Indices");
ylabel("Amplitude");
hold on;
plot(f, dsp_blackman);
legend("Fenetre de Hamming", "Fenetre de Blackman");


%% 5.4.4


dsp_welch=pwelch(x,"","","",'twosided');
fwelch=[0:Fe/length(dsp_welch):Fe-Fe/length(dsp_welch)];
figure,
plot(fwelch, dsp_welch);
title("(Figure 9) DSP avec fenetres welch");
xlabel("Indices");
ylabel("Amplitude");

%% 5.4.5

figure,
plot(f, dsp);
hold on;
plot(f, dsp_hamming);
hold on;
plot(f, dsp_blackman);
hold on;
plot(fwelch, dsp_welch);
title("(Figure 10) DSPs");
xlabel("Indices");
ylabel("Amplitude");
legend("DSP classique", "DSP avec fenetre de Hamming", "DSP avec fenetre de Blackman", "DSP avec fenetre de welch");