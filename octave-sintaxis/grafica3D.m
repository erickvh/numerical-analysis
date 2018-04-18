tx=linspace(-8,8,41);
ty=linspace(-8,8,41);
[x,y]=meshgrid(tx,ty);
r=sqrt(x.^2+y.^2)+eps;
tz=sin(r)./r;
mesh(tx,ty,tz);