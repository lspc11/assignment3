clear
fm=10;fc=10000;
am=sqrt(2);
Fs=40000;     %采样频率Fs，载波频率fc，信号频率fm
wc=2*pi*fc;
wm=fm*2*pi;
N=40000;
n=0:N-1;
t=n/Fs;             %时间序列
f=n*Fs/N;
um=am*cos(wm*t);%基带信号
figure(1);
subplot(411);
plot(t,um);
title('基带信号');
xlabel('t');
axis([0 1 -2 2]);
grid on
uc=cos(wc*t);%载波信号
subplot(412);
plot(t,uc);
title('载波信号');
xlabel('t');
axis([0 0.01 -2 2]);
grid on
%-------------------频域基带与载波信号----------------%
S=fft(um);
SG=abs(S);
subplot(413);
plot(f,SG);      %SSB信号频域波形
axis([0 100 0 30000]);
xlabel('Frequency(kHZ)');
title('基带信号频域波形 ');
grid on;
T=fft(uc);%载波频域波形
TG=abs(T);
subplot(414);
plot(f,TG);      %SSB信号频域波形
axis([5000 15000 0 30000]);
xlabel('Frequency(kHZ)');
title('载波信号频域波形 ');
grid on;
%--------------------------------------SSB调制（移相法）------------------------------%
Udsb=uc.*um;
uc_h=am*cos(wm*t-pi/2);;%希尔伯特变换，移向-pi/2
um_h=cos(wc*t-pi/2);
Udsb_h=uc_h.*um_h;
Ulsf=Udsb+Udsb_h;%下边带
Uusf=Udsb-Udsb_h;%上边带
V=fft(Ulsf);
VG=abs(V);
X=fft(Ulsf);
XG=abs(X);
figure(2);
plot(t,Udsb);
title('DSB信号');
xlabel('t');
axis([0 1 -2 2]);
grid on;
figure(3);
subplot(311);
title('DSB幅频特性');
xlabel('Frequency(kHZ)');
axis([9900 10100 0 100000]);
plot(f,XG);
subplot(312);
plot(f,VG);
title('下边带幅频特性');
xlabel('Frequency(kHZ)');
axis([9900 10100 0 100000]);
grid on;
W=fft(Uusf);
WG=abs(W);
subplot(313);
plot(f,WG);
title('上边带幅频特性');
xlabel('Frequency(kHZ)');
axis([9900 10100 0 100000]);
grid on;