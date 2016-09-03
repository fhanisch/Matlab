function F = Magnetfeldvektoren
close;
f=1;
w=2*pi*f;
t=0:0.01:1;
B1=0.7*cos(w*t);
B2=0.7*cos(w*t+deg2rad(120));
B3=0.7*cos(w*t+deg2rad(240));
subplot(1,2,2);
xlabel('t [s]','fontSize',14);
ylabel('B,I','fontSize',14,'Rotation',0,'HorizontalAlignment','right');
set(gca,'fontSize',12);
grid;
line(t,B1,'color','r');
line(t,B2,'color','g');
line(t,B3,'color','b');

subplot(1,2,1);
set(gca,'visible','off');
alpha=[0,120,240]; 


scale_kreuz=0.7;
scale_strom=0.07;
kreuz=[-0.1 0.1; -0.1 0.1;-0.1 0.1;0.1 -0.1]*scale_kreuz;


farbe='rgb';
phi=0:pi/100:2*pi;
x=cos(phi);
y=sin(phi);
line(1.1*x,1.1*y,'color','black');
line(1.3*x,1.3*y,'color','black');
set(gcf,'Position',[0 0 1200 500]);
for i=1:length(alpha)
    dx=-1.2*cos(deg2rad(alpha(i)));
    dy=-1.2*sin(deg2rad(alpha(i)));
    line(0.1*x+dx,0.1*y+dy,'color',farbe(i),'LineWidth',2); 
    line(0.1*x-dx,0.1*y-dy,'color',farbe(i),'LineWidth',2); 
    hold on;
    h_Strom{i}=fill(scale_strom*x+dx,scale_strom*y+dy,farbe(i),'edgeColor',farbe(i));
    hold off;   
    h_k1{i}=line(kreuz(1,:)-dx,kreuz(2,:)-dy,'color',farbe(i));
    h_k2{i}=line(kreuz(3,:)-dx,kreuz(4,:)-dy,'color',farbe(i));    
end

arrow=[-0.1 0 0.1; -0.5 0 -0.5]*0.25;
hAr1=line(arrow(1,:),arrow(2,:),'color','r');
hAr2=line(arrow(1,:),arrow(2,:),'color','g');
hAr3=line(arrow(1,:),arrow(2,:),'color','b');
hAr_res=line(arrow(1,:),arrow(2,:),'color','black');

subplot(1,2,2);
hT=line([0 0],[-1 1],'color','black');
subplot(1,2,1);
hB1=line([0 0],[0 0.5],'color','r');
hB2=line([0 0],[0 0.5],'color','g');
hB3=line([0 0],[0 0.5],'color','b');
hB_res=line([0 0],[0 0.5],'color','black');


for k=1:length(t)
    subplot(1,2,2);

    set(hT,'XData',[t(k) t(k)],'YData',[-1 1]);

    subplot(1,2,1);
    
    b1(1)=0;
    b1(2)=B1(k);

    b2(1)=B2(k)*cos(deg2rad(90+120));
    b2(2)= B2(k)*sin(deg2rad(90+120));

    b3(1)=B3(k)*cos(deg2rad(90+240));
    b3(2)=B3(k)*sin(deg2rad(90+240));
    
    set(hB_res,'XData',[0 b1(1)+b2(1)+b3(1)], 'YData',[0 b1(2)+b2(2)+b3(2)]);

    set(hB1,'XData',[0 b1(1)],'YData',[0 b1(2)]);
    set(hB2,'XData',[b1(1) b1(1)+b2(1)],'YData',[b1(2) b1(2)+b2(2)]);
    set(hB3,'XData',[b1(1)+b2(1) b1(1)+b2(1)+b3(1)],'YData',[b1(2)+b2(2) b1(2)+b2(2)+b3(2)]);
    
    phi=deg2rad(90)-deg2rad(90)*sign(B1(k));
    T=[cos(phi) -sin(phi);sin(phi) cos(phi)];
    arr=[T*arrow(:,1) T*arrow(:,2) T*arrow(:,3)];
    arr=arr+[ones(1,3)*b1(1);ones(1,3)*b1(2)];
    set(hAr1,'XData',arr(1,:),'YData',arr(2,:));

    phi=-deg2rad(150)-deg2rad(90)*sign(B2(k));
    T=[cos(phi) -sin(phi);sin(phi) cos(phi)];
    arr=[T*arrow(:,1) T*arrow(:,2) T*arrow(:,3)];
    arr=arr+[ones(1,3)*(b1(1)+b2(1));ones(1,3)*(b1(2)+b2(2))];
    set(hAr2,'XData',arr(1,:),'YData',arr(2,:));

    phi=deg2rad(150)+deg2rad(90)*sign(B3(k));
    T=[cos(phi) -sin(phi);sin(phi) cos(phi)];
    arr=[T*arrow(:,1) T*arrow(:,2) T*arrow(:,3)];
    arr=arr+[ones(1,3)*(b1(1)+b2(1)+b3(1));ones(1,3)*(b1(2)+b2(2)+b3(2))];
    set(hAr3,'XData',arr(1,:),'YData',arr(2,:));
    
%     phi=-atan((b1(1)+b2(1)+b3(1))/(b1(2)+b2(2)+b3(2)));
    phi=-w*t(k);
    T=[cos(phi) -sin(phi);sin(phi) cos(phi)];
    arr=[T*arrow(:,1) T*arrow(:,2) T*arrow(:,3)];
    arr=arr+[ones(1,3)*(b1(1)+b2(1)+b3(1));ones(1,3)*(b1(2)+b2(2)+b3(2))];
    set(hAr_res,'XData',arr(1,:),'YData',arr(2,:));
    
    B=[B1(k) B2(k) B3(k)];
    vz=[1 -1 -1];
    for i=1:length(alpha)    
        dx=-1.2*cos(deg2rad(alpha(i)));
        dy=-1.2*sin(deg2rad(alpha(i)));
        hold on;
        set(h_Strom{i},'XData',x*B(i)/0.7*scale_strom+dx*sign(B(i))*vz(i),'YData',y*B(i)/0.7*scale_strom+dy*sign(B(i))*vz(i));
        hold off;   
        set(h_k1{i},'XData',kreuz(1,:)*B(i)/0.7*scale_kreuz-dx*sign(B(i))*vz(i),'YData',kreuz(2,:)*B(i)/0.7*scale_kreuz-dy*sign(B(i))*vz(i));
        set(h_k2{i},'XData',kreuz(3,:)*B(i)/0.7*scale_kreuz-dx*sign(B(i))*vz(i),'YData',kreuz(4,:)*B(i)/0.7*scale_kreuz-dy*sign(B(i))*vz(i));    
    end
    F(k)=getframe(gcf);
    pause(0.1);
end

end


function rad=deg2rad(phi)
    rad=pi/180*phi;
end