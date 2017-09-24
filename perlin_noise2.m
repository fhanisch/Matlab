clear;
close all;

x=0:0.005:1;
y=0:0.005:1;
[X,Y]=meshgrid(x,y);

for j=1:length(y)
    for i=1:length(x)

        Z1(i,j)=4*perlin_interp2(2*x(i),2*y(j));
        Z2(i,j)=2*perlin_interp2(5*x(i),5*y(j));
        Z3(i,j)=0.25*perlin_interp2(20*x(i),20*y(j));    

    end
end

Z=Z1+Z2+Z3;

surfl(X,Y,Z);
shading interp
colormap(bone);
