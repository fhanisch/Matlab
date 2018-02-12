clear;
close all;

x=0:0.005:1;
y=0:0.005:1;
[X,Y]=meshgrid(x,y);

for j=1:length(y)
    for i=1:length(x)
        X(i,j)=sin(y(j)*pi)*cos(x(i)*2*pi);
        Y(i,j)=sin(y(j)*pi)*sin(x(i)*2*pi);
        Z(i,j)=cos(y(j)*pi);
        dr = 0.1*perlin_interp2(4*(X(i,j)+1),4*(Y(i,j)+1)) + 0.1*perlin_interp2(4*(X(i,j)+1),4*(Z(i,j)+1));
        X(i,j) = (1+dr)*X(i,j);
        Y(i,j) = (1+dr)*Y(i,j);
        Z(i,j) = (1+dr)*Z(i,j);
    end
end


h=surfl(X,Y,Z);
shading interp
hold on
axis equal
camlight
set(h,'facecolor',[1 0 0]); 