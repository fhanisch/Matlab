clear;
close all;

u=0:181;
v=0:361;
g_x=2*rand(length(u),length(v))-1;
g_y=2*rand(length(u),length(v))-1;
x=0:0.5:180;
y=0:0.5:360;
X=zeros(length(x),length(y));
Y=X;
Z=X;

for j=1:length(y)
    for i=1:length(x)
          
        dR=0.5*perlin_interp2(0.2*x(i),0.2*y(j),g_x,g_y);
        X(i,j)=(5-dR)*sin(x(i)*pi/180)*cos(y(j)*pi/180);
        Y(i,j)=(5-dR)*sin(x(i)*pi/180)*sin(y(j)*pi/180);
        Z(i,j)=(5-dR)*cos(x(i)*pi/180);
    end
end

surfl(X,Y,Z);
shading interp
colormap(bone);