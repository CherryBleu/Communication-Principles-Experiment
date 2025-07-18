% 非周期矩形脉冲信号

t = -4:0.0001:4;
T = 4; % 设置信号宽度
x1 = 2 * rectpuls(t,T); % 信号函数调用
subplot(121);plot(t,x1);
title('x(t -T,2)');axis([-4 6 0 2.2]);