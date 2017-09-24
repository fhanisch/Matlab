clear;
close all;

u=0:100;
g=2*random(u, 1589)-1;
% plot(u,g,'o');
grid;
hold;
x=0:0.001:1;
y=zeros(1,length(x));
y1=y;
y2=y;
y3=y;

for i=1:length(x)
        
    y1(i)=4*perlin_interp(2*x(i),g);
    y2(i)=2*perlin_interp(5*x(i),g);
    y3(i)=0.25*perlin_interp(40*x(i),g);
    
end

y=y1+y2+y3;

plot(x,y1,'b');
plot(x,y2,'r');
plot(x,y3,'g');
plot(x,y,'color','black');