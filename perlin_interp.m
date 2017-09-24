function w=perlin_interp(u)

    x=u-floor(u);
    g_0=2*random(floor(u), 1589)-1;
    g_1=2*random(floor(u)+1, 1589)-1;
    w_0=g_0*x;
    w_1=g_1*(x-1);
    s_x=10*x^3-15*x^4+6*x^5;
    w=(1-s_x)*w_0+s_x*w_1;
    
end