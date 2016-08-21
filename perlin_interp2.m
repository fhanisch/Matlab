function w=perlin_interp2(x,y,g_x,g_y)

    p_x=floor(x);
    p_y=floor(y);
    x=x-p_x;
    y=y-p_y;
    p_x=p_x+1;
    p_y=p_y+1;
    g_00=[g_x(p_x,p_y);g_y(p_x,p_y)];
    g_10=[g_x(p_x+1,p_y);g_y(p_x+1,p_y)];
    g_01=[g_x(p_x,p_y+1);g_y(p_x,p_y+1)];
    g_11=[g_x(p_x+1,p_y+1);g_y(p_x+1,p_y+1)];
    w_00=dot(g_00,[x;y]);
    w_10=dot(g_10,[x-1;y]);
    w_01=dot(g_01,[x;y-1]);
    w_11=dot(g_11,[x-1;y-1]);
    s_x=10*x^3-15*x^4+6*x^5;
    s_y=10*y^3-15*y^4+6*y^5;
    w_0=(1-s_x)*w_00+s_x*w_10;
    w_1=(1-s_x)*w_01+s_x*w_11;
    w=(1-s_y)*w_0+s_y*w_1;
    
end