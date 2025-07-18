% 非周期连续时间信号及其Fourier变换的程序
width=1; 
t=-5:0.01:5; 
y=rectpuls(t,width);     % 矩形脉冲信号
 
subplot(221); 
plot(t,y);
 
ylim([-1 2]);      
title('矩形脉冲信号'); 
Y=fft(y,1024);          
Y1=fftshift(Y);     
subplot(212); 
plot(abs(Y1)); 
title('傅里叶变换');
