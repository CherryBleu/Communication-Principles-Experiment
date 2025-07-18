% 试用MATLAB编程计算抑制载波双边带(DSB-SC)调制信号及其功率谱密度，所用基带模拟信号和载波表达式同上。

clc; clear;

% 参数设置
dt = 0.001;             % 采样间隔
fs = 1;                 % 基带信号频率 (Hz)
fc = 10;                % 载波频率 (Hz)
T = 5;                  % 信号时长 (秒)
N = T / dt;             % 总采样点数
t = [0:N-1] * dt;       % 时间向量

% 基带信号
mt = sqrt(2) * cos(2*pi*fs*t);

% 载波信号
ct = cos(2*pi*fc*t);

% DSB-SC 调制信号
s_dsbsc = mt .* ct;

% 快速傅里叶变换
X = fft(s_dsbsc);
M = fft(mt);

% 功率谱密度
PSD_X = abs(X).^2 / T;
PSD_M = abs(M).^2 / T;

% 将 PSD 移到中心
PSD_X = fftshift(PSD_X);
PSD_M = fftshift(PSD_M);

% 转换为 dB
PSD_X_dB = 10*log10(PSD_X + eps);  % 避免 log(0)
PSD_M_dB = 10*log10(PSD_M + eps);

% 构建频率向量
f = [-N/2:N/2-1] * (1/dt/N);  % 单位：Hz

% 绘图
subplot(3,1,1);
plot(t, s_dsbsc);
title('DSB-SC 调制信号（时域）');
xlabel('时间 / s'); ylabel('幅度');

subplot(3,1,2);
plot(f, PSD_M_dB);
title('基带信号的功率谱密度（dB）');
xlabel('频率 / Hz'); ylabel('功率 / dB');
axis([-2*fc 2*fc min(PSD_M_dB) max(PSD_M_dB)]); grid on;

subplot(3,1,3);
plot(f, PSD_X_dB);
title('DSB-SC 调制信号的功率谱密度（dB）');
xlabel('频率 / Hz'); ylabel('功率 / dB');
axis([-2*fc 2*fc min(PSD_X_dB) max(PSD_X_dB)]); grid on;

