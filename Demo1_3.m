% 抽样信号

clear; % 清理变量
t = -1:0.001:1;
y = sinc(2*pi*t); % 信号函数调用
plot(t,y);
xlabel('时间 t');ylabel('幅值(y)');
title('抽样信号');