clear;
close all;

x=0:0.005:1;
y=0:0.005:1;
[X,Y]=meshgrid(x,y);

for j=1:length(y)
    for i=1:length(x)
        u=acos(cos(x(i)*2*pi)*sin(y(j)*pi));
        v=asin(sin(y(j)*pi)*sin(x(i)*2*pi));
        dR=0.25*perlin_interp2(4*u, 4*v);
        X(i,j)=(1+dR)*sin(y(j)*pi)*cos(x(i)*2*pi);
        Y(i,j)=(1+dR)*sin(y(j)*pi)*sin(x(i)*2*pi);
        Z(i,j)=(1+dR)*cos(y(j)*pi);
    end
end


h=surfl(X,Y,Z);
shading interp
hold on
axis equal
camlight
set(h,'facecolor',[1 0 0]); 