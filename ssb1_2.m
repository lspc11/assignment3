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
uc=cos(wc*t);%�ز��ź�
Udsb=uc.*um;
uc_h=am*cos(wm*t-pi/2);;%ϣ�����ر任������-pi/2
um_h=cos(wc*t-pi/2);
Udsb_h=uc_h.*um_h;
Ulsf=Udsb+Udsb_h;%�±ߴ�
Uusf=Udsb-Udsb_h;%�ϱߴ�
sd=demod(Ulsf,fc,Fs,'amssb');   %�������
figure(1);
subplot(211);
plot(t,sd);
title('������ź�ʱ����');
xlabel('t');
axis([0 1 -2 2]);
grid on
SG=fft(sd);
SGG=abs(SG);
subplot(212)
plot(f,SGG);
title('Ƶ����')
axis([0 100 0 30000]);