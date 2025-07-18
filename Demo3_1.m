%  AM调制信号及其功率谱计算的程序

% AM基带信号
 
dt=0.001;            % 采样时间间隔
 
fs=1;               % 基带信号频率
 
fc=10;              % 载波频率
 
T=5;                % 调制信号的时间长度
 
N=T/dt;             % 采样点总数
 
t=[0:N-1]*dt;                         % 采样时间变量
 
mt=sqrt(2)*cos(2*pi*fs*t);            % 基带信号时域表达式
 
 
% AM调制信号
 
A0=2;                             % 直流偏移量
 
s_AM=(A0+mt).*cos(2*pi*fc*t);        % AM调制信号
 
 
% PSD计算
 
[X]=fft(s_AM);                           % 对AM调制信号进行快速Fourier变换
 
[Y]=fft(mt);                             % 对基带信号进行快速Fourier变换
 
PSD_X=(abs(X).^2)/T;                     % 根据功率谱密度公式计算AM调制信号的PSD 
PSD=(abs(Y).^2)/T;                       % 根据功率谱密度公式计算基带信号的PSD 
PSD_Y=fftshift(PSD);                     % 将零频分量移到频谱的中心位置
 
PSD_X_dB = 10*log10(PSD_X);             % 将功率化为以dB为单位
 
PSD_Y_dB = 10*log10(PSD_Y);            % 将功率化为以dB为单位
 
f=[-N/2:N/2-1]*2*fc/N;                   % 设置频率变量

% 绘图输出
 
subplot(311); 
plot(t,s_AM); hold on; 
plot(t,A0+mt,'r--');                      
title('AM 调制信号及其包络'); 
subplot(312); 
plot(f,PSD_Y_dB); hold on; 
axis([-2*fc 2*fc 0 max(PSD_Y_dB)]); 
title('基带信号的 PSD(dB)'); 
subplot(313); 
plot(f,PSD_X_dB); hold on; 
axis([-2*fc 2*fc 0 max(PSD_X_dB)]); 
title('AM 调制信号的PSD(dB)'); 