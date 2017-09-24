clear;
close all;
figure;
hold;
grid;

x=0:0.001:1;

for i=1:length(x)
        
    y1(i)=4*perlin_interp(2*x(i));
    y2(i)=2*perlin_interp(5*x(i));
    y3(i)=0.25*perlin_interp(30*x(i));
    
end

y=y1+y2+y3;

plot(x,y1,'b');
plot(x,y2,'r');
plot(x,y3,'g');
plot(x,y,'color','black');