function y=grad_interp(x,g)

    p=floor(x);
    x=x-p;
    p=p+1;
    g_0=g(p);
    g_1=g(p+1);
    y=g_0*(x-1)^2*x+g_1*(x-1)*x^2;
    
end