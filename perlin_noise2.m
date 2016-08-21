clear;
close all;

u=0:100;
v=0:100;
g_x=2*rand(length(u))-1;
g_y=2*rand(length(v))-1;
x=0:0.01:10;
y=0:0.01:10;
[X,Y]=meshgrid(x,y);
Z=zeros(length(x));
Z1=Z;
Z2=Z;
Z3=Z;

for j=1:length(y)
    for i=1:length(x)

        Z1(i,j)=4*perlin_interp2(0.2*x(i),0.2*y(j),g_x,g_y);
        Z2(i,j)=2*perlin_interp2(0.5*x(i),0.5*y(j),g_x,g_y);
        Z3(i,j)=0.25*perlin_interp2(4*x(i),4*y(j),g_x,g_y);    

    end
end

Z=Z1+Z2+Z3;

surfl(X,Y,Z);
shading interp
colormap(bone);