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
uc=cos(wc*t);%载波信号
Udsb=uc.*um;
uc_h=am*cos(wm*t-pi/2);;%希尔伯特变换，移向-pi/2
um_h=cos(wc*t-pi/2);
Udsb_h=uc_h.*um_h;
Ulsf=Udsb+Udsb_h;%下边带
Uusf=Udsb-Udsb_h;%上边带
sd=demod(Ulsf,fc,Fs,'amssb');   %解调函数
figure(1);
subplot(211);
plot(t,sd);
title('解调后信号时域波形');
xlabel('t');
axis([0 1 -2 2]);
grid on
SG=fft(sd);
SGG=abs(SG);
subplot(212)
plot(f,SGG);
title('频域波形')
axis([0 100 0 30000]);