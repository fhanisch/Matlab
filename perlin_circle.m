clear;
close all;

t=0:0.001:1;

for i=1:length(t)
  x(i)=cos(2*pi*t(i));
  y(i)=sin(2*pi*t(i));
  dr = 0.5*perlin_interp2(2*(x(i)+1),2*(y(i)+1)) + 0.2*perlin_interp2(8*(x(i)+1),8*(y(i)+1));
  x(i)=(1+dr)*x(i);
  y(i)=(1+dr)*y(i);
end

plot(x,y,'r','linewidth',2);
axis equal