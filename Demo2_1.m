% 连续时间周期方波信号及其傅里叶级数计算的程序

dt = 0.001;                             % 时间变量变化步长
 
T =2;                                 % 定义信号的周期
 
t =-4:dt:4;                             % 定义信号的时间变化范围
 
w0 = 2*pi/T;                           % 定义信号的频率
 
x1=rectpuls( t-0.5-dt,1);                  % 产生1个周期的方波信号
 
x=0; 
for m = -1:1                            % 扩展1个周期的方波信号
 
  x = x+rectpuls((t-0.5-m*T-dt),1);         % 产生周期方波信号
 
end 
subplot(221); 
plot(t,x); 
axis([-4 4 0 1.1]);                        % 设定坐标变化范围
 
title('周期方波信号') 
N=10;                                % 定义需要计算的谐波次数为10 
for k=-N : N 
  ak(N+1+k) = x1*exp(-j*k*w0*t') *dt/T;     % 求得Fourier系数ak 
end 
k=-N:N; 
subplot(212); 
stem(k,abs(ak),'k.');                       % 绘制幅度谱
 

title('傅里叶级数');