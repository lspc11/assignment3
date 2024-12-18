clear
fm=10;fc=10000;
am=sqrt(2);
Fs=40000;     %����Ƶ��Fs���ز�Ƶ��fc���ź�Ƶ��fm
wc=2*pi*fc;
wm=fm*2*pi;
N=40000;
n=0:N-1;
t=n/Fs;             %ʱ������
f=n*Fs/N;
um=am*cos(wm*t);%�����ź�
figure(1);
subplot(411);
plot(t,um);
title('�����ź�');
xlabel('t');
axis([0 1 -2 2]);
grid on
uc=cos(wc*t);%�ز��ź�
subplot(412);
plot(t,uc);
title('�ز��ź�');
xlabel('t');
axis([0 0.01 -2 2]);
grid on
%-------------------Ƶ��������ز��ź�----------------%
S=fft(um);
SG=abs(S);
subplot(413);
plot(f,SG);      %SSB�ź�Ƶ����
axis([0 100 0 30000]);
xlabel('Frequency(kHZ)');
title('�����ź�Ƶ���� ');
grid on;
T=fft(uc);%�ز�Ƶ����
TG=abs(T);
subplot(414);
plot(f,TG);      %SSB�ź�Ƶ����
axis([5000 15000 0 30000]);
xlabel('Frequency(kHZ)');
title('�ز��ź�Ƶ���� ');
grid on;
%--------------------------------------SSB���ƣ����෨��------------------------------%
Udsb=uc.*um;
uc_h=am*cos(wm*t-pi/2);;%ϣ�����ر任������-pi/2
um_h=cos(wc*t-pi/2);
Udsb_h=uc_h.*um_h;
Ulsf=Udsb+Udsb_h;%�±ߴ�
Uusf=Udsb-Udsb_h;%�ϱߴ�
V=fft(Ulsf);
VG=abs(V);
X=fft(Ulsf);
XG=abs(X);
figure(2);
plot(t,Udsb);
title('DSB�ź�');
xlabel('t');
axis([0 1 -2 2]);
grid on;
figure(3);
subplot(311);
title('DSB��Ƶ����');
xlabel('Frequency(kHZ)');
axis([9900 10100 0 100000]);
plot(f,XG);
subplot(312);
plot(f,VG);
title('�±ߴ���Ƶ����');
xlabel('Frequency(kHZ)');
axis([9900 10100 0 100000]);
grid on;
W=fft(Uusf);
WG=abs(W);
subplot(313);
plot(f,WG);
title('�ϱߴ���Ƶ����');
xlabel('Frequency(kHZ)');
axis([9900 10100 0 100000]);
grid on;