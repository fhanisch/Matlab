clear;
close all;

u=0:10;
g=2*rand(1,length(u))-1;
plot(u,g,'o');
grid;
hold;
x=0:0.1:10;
y=zeros(1,length(x));

for i=1:length(x)-1
    
    y(i)=grad_interp(x(i),g);
    
end

plot(x,y,'r');