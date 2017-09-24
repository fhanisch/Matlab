function w=perlin_interp2(u,v)

    x=u-floor(u);
    y=v-floor(v);
    g_00=[2*random2d([floor(u);floor(v)], 1289)-1; 2*random2d([floor(u);floor(v)], 587)-1];
    g_10=[2*random2d([floor(u);floor(v)]+[1;0], 1289)-1; 2*random2d([floor(u);floor(v)]+[1;0], 587)-1];
    g_01=[2*random2d([floor(u);floor(v)]+[0;1], 1289)-1; 2*random2d([floor(u);floor(v)]+[0;1], 587)-1];
    g_11=[2*random2d([floor(u);floor(v)]+[1;1], 1289)-1; 2*random2d([floor(u);floor(v)]+[1;1], 587)-1];
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