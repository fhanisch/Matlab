function [F] = Drehfeld
    close;
    [X,Y]=meshgrid(-1.5:0.1:1.5);
    r=[0,120,240];     
    farbe='rgb';
    w=2*pi;
    hq=quiver(X,Y,zeros(size(X)),zeros(size(Y)));
    set(gcf,'Position',[0 0 1000 1000]);
    set(gca,'Position',[0.1 0.1 0.8 0.8]);
    n=0:pi/100:2*pi;
    x=cos(n);
    y=sin(n);
    line(x,y,'color','black','LineWidth',2);  
    
    for i=1:length(r)
        dx=-cos(pi/180*r(i));
        dy=-sin(pi/180*r(i));
        line(x/16+dx,y/16+dy,'color',farbe(i),'LineWidth',4); 
        line(x/16-dx,y/16-dy,'color',farbe(i),'LineWidth',4); 
    end
    k=1;    
    for t=0:0.25/4:10;
        P_res=0;
        Q_res=0;
        phi=[w*t w*t+pi/180*120 w*t+pi/180*240];
        for i=1:length(r)
            dx=-cos(pi/180*r(i));
            dy=-sin(pi/180*r(i));
            Xs=X+dx;
            Ys=Y+dy;           
            P1=-10*cos(phi(i))/(2*pi)*1./(Xs.*Xs+Ys.*Ys).*(-Ys);
            Q1=-10*cos(phi(i))/(2*pi)*1./(Xs.*Xs+Ys.*Ys).*(Xs);       

            Xs=X-dx;
            Ys=Y-dy;        
            P2=10*cos(phi(i))/(2*pi)*1./(Xs.*Xs+Ys.*Ys).*(-Ys);
            Q2=10*cos(phi(i))/(2*pi)*1./(Xs.*Xs+Ys.*Ys).*(Xs);               
    %         quiver(X,Y,P1+P2,Q1+Q2,2);
            P_res=P_res+P1+P2;
            Q_res=Q_res+Q1+Q2;

        end	
        set(hq,'UData',P_res,'VData',Q_res,'AutoScaleFactor',3);
%         refreshdata;
%         drawnow;        
        p_res=P_res(16,16);
        q_res=Q_res(16,16);     
        disp(sqrt(p_res^2+q_res^2));
        F(k)=getframe;
        k=k+1;
        pause(0.1);
    end
end