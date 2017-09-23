function [ output_args ] = Welle( input_args )

  figure;
  t=0;
  x=0:0.01:1;
  y=1/10*sin(2*pi*t)*sin(2*pi*(t-4*x));
  hLine=line(x,y);
  set(gca,'YLim',[-0.1 0.1]);
  set(gca,'XLim',[0 1]);
  for i=1:1:10000
      pause(0.0001);
      t=t+0.005;
      y=1/10*sin(2*pi*t)*sin(2*pi*(t-4*x));
      set(hLine,'YData',y);
  end
  
end
