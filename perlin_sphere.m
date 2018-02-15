clear;
close all;

x=0:0.005:1;
y=0:0.005:1;

for j=1:length(y)
    for i=1:length(x)
        X(i,j)=sin(y(j)*pi)*cos(x(i)*2*pi);
        Y(i,j)=sin(y(j)*pi)*sin(x(i)*2*pi);
        Z(i,j)=cos(y(j)*pi);
        dr = 0.25*perlin_interp3(2*(X(i,j)+1),2*(Y(i,j)+1),2*(Z(i,j)+1)) + 0.1*perlin_interp3(8*(X(i,j)+1),8*(Y(i,j)+1),8*(Z(i,j)+1));
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
%lighting phong
set(h,'facecolor',[1 0 0]); 