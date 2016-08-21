function w=perlin_interp(x,g)

    p=floor(x);
    x=x-p;
    p=p+1;
    g_0=g(p);
    g_1=g(p+1);
    w_0=g_0*x;
    w_1=g_1*(x-1);
    s_x=10*x^3-15*x^4+6*x^5;
    w=(1-s_x)*w_0+s_x*w_1;
    
end