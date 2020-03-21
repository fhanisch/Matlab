% Simulation Zweimassenschwinger mit dem 2-Schritt-BDF-Verfahren und dem Newton-Verfahren
clear;
figure;

e = 1e-7;

m_1 = 1;
m_2 = 2;
c_1 = 1000;
c_2 = 500;
d_1 = 10;
d_2 = 5;
x_r = 1;
x_1_0 = 1;
x_2_0 = 2;
v_1_0 = 0;
v_2_0 = 0;
l = 1;

h = 0.01;
t_stop = 10;

t(1) = 0;
x_1(1) = x_1_0;
x_2(1) = x_2_0;
v_1(1) = v_1_0;
v_2(1) = v_2_0;

J = [1/h, 0 , -1, 0; 0, 1/h, 0, -1; (c_1 + c_2)/m_1, -c_2/m_1, 1/h + (d_1 + d_2)/m_1, -d_2/m_1; -c_2/m_2, c_2/m_2, -d_2/m_2, 1/h + d_2/m_2];
J_2 = [3/2*1/h, 0 , -1, 0; 0, 3/2*1/h, 0, -1; (c_1 + c_2)/m_1, -c_2/m_1, 3/2*1/h + (d_1 + d_2)/m_1, -d_2/m_1; -c_2/m_2, c_2/m_2, -d_2/m_2, 3/2*1/h + d_2/m_2];

for j=1:1/h*t_stop
    
    t(j+1) = t(j)+h;
    
    x_1_neu = x_1(j) + h*v_1(j);
    x_2_neu = x_2(j) + h*v_2(j);
    v_1_neu = v_1(j) + h*(-c_1/m_1*(x_1(j) - x_r - l) - d_1/m_1*v_1(j) + c_2/m_1*(x_2(j) - x_1(j) - l) + d_2/m_1*(v_2(j) - v_1(j)));
    v_2_neu = v_2(j) + h*(-c_2/m_2*(x_2(j) - x_1(j) - l) - d_2/m_2*(v_2(j) - v_1(j)));

    while (1)
        
        if j<2
            
            f_1 = (x_1_neu - x_1(j))/h - v_1_neu;
            f_2 = (x_2_neu - x_2(j))/h - v_2_neu;
            f_3 = (v_1_neu - v_1(j))/h + c_1/m_1*(x_1_neu - x_r - l) + d_1/m_1*v_1_neu - c_2/m_1*(x_2_neu - x_1_neu - l) - d_2/m_1*(v_2_neu - v_1_neu);
            f_4 = (v_2_neu - v_2(j))/h + c_2/m_2*(x_2_neu - x_1_neu - l) + d_2/m_2*(v_2_neu - v_1_neu);

            f = [f_1; f_2; f_3; f_4];

            dx = -J^-1*f;
        
        else
            
            f_1 = (3/2*x_1_neu - 2*x_1(j) + 1/2*x_1(j-1))/h - v_1_neu;
            f_2 = (3/2*x_2_neu - 2*x_2(j) + 1/2*x_2(j-1))/h - v_2_neu;
            f_3 = (3/2*v_1_neu - 2*v_1(j) + 1/2*v_1(j-1))/h + c_1/m_1*(x_1_neu - x_r - l) + d_1/m_1*v_1_neu - c_2/m_1*(x_2_neu - x_1_neu - l) - d_2/m_1*(v_2_neu - v_1_neu);
            f_4 = (3/2*v_2_neu - 2*v_2(j) + 1/2*v_2(j-1))/h + c_2/m_2*(x_2_neu - x_1_neu - l) + d_2/m_2*(v_2_neu - v_1_neu);

            f = [f_1; f_2; f_3; f_4];

            dx = -J_2^-1*f;
            
        end

        if abs(x_1_neu - (x_1_neu + dx(1)))<e && abs(x_2_neu - (x_2_neu + dx(2)))<e && abs(v_1_neu - (v_1_neu + dx(3)))<e && abs(v_2_neu - (v_2_neu + dx(4)))<e
            break;
        end

        x_1_neu = x_1_neu + dx(1);
        x_2_neu = x_2_neu + dx(2);
        v_1_neu = v_1_neu + dx(3);
        v_2_neu = v_2_neu + dx(4);

    end
    
    x_1(j+1) = x_1_neu;
    x_2(j+1) = x_2_neu;
    v_1(j+1) = v_1_neu;
    v_2(j+1) = v_2_neu;
    
end

plot(t,x_1);
grid;
hold;
plot(t,x_2);