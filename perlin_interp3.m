function w=perlin_interp3(u,v,w)

    x=u-floor(u);
    y=v-floor(v);
    z=w-floor(w);
    
    g_000=[2*random3d([floor(u);floor(v);floor(w)]+[0;0;0], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;0;0], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;0;0], 23)-1];
    g_100=[2*random3d([floor(u);floor(v);floor(w)]+[1;0;0], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;0;0], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;0;0], 23)-1];
    g_010=[2*random3d([floor(u);floor(v);floor(w)]+[0;1;0], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;1;0], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;1;0], 23)-1];
    g_110=[2*random3d([floor(u);floor(v);floor(w)]+[1;1;0], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;1;0], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;1;0], 23)-1];
    
    g_001=[2*random3d([floor(u);floor(v);floor(w)]+[0;0;1], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;0;1], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;0;1], 23)-1];
    g_101=[2*random3d([floor(u);floor(v);floor(w)]+[1;0;1], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;0;1], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;0;1], 23)-1];
    g_011=[2*random3d([floor(u);floor(v);floor(w)]+[0;1;1], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;1;1], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[0;1;1], 23)-1];
    g_111=[2*random3d([floor(u);floor(v);floor(w)]+[1;1;1], 1289)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;1;1], 587)-1; 2*random3d([floor(u);floor(v);floor(w)]+[1;1;1], 23)-1];
    
    
    w_000=dot(g_000,[x;y;z]);
    w_100=dot(g_100,[x-1;y;z]);
    w_010=dot(g_010,[x;y-1;z]);
    w_110=dot(g_110,[x-1;y-1;z]);
    
    w_001=dot(g_001,[x;y;z-1]);
    w_101=dot(g_101,[x-1;y;z-1]);
    w_011=dot(g_011,[x;y-1;z-1]);
    w_111=dot(g_111,[x-1;y-1;z-1]);
    
    
    s_x=10*x^3-15*x^4+6*x^5;
    s_y=10*y^3-15*y^4+6*y^5;
    s_z=10*z^3-15*z^4+6*z^5;
    
    
    w_00=(1-s_x)*w_000+s_x*w_100;
    w_10=(1-s_x)*w_010+s_x*w_110;
    
    w_01=(1-s_x)*w_001+s_x*w_101;
    w_11=(1-s_x)*w_011+s_x*w_111;
    
  
    w_0=(1-s_y)*w_00+s_y*w_10;
    w_1=(1-s_y)*w_01+s_y*w_11;
    
    
    w=(1-s_z)*w_0+s_z*w_1;
    
end