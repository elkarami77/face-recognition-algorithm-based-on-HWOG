function A=ori_gradient(Image)

f3=[0,0,0;1,0,-1;0,0,0];
f5=[0,0,0;0,1,0;0,0,0];
f4=[0,-1,0;0,0,0;0,1,0]; 
f6=[0,0,0;0,1,0;0,0,0];

% [row, col]=size(Image);
v3=filter2(f3,Image);
v4=filter2(f4,Image);
v5=filter2(f5,Image);
v6=filter2(f6,Image);
% b5=zeros(size(v5));
v1=v3./(v5+1);
v2=v4./(v6+1);
A=sqrt(v1.^2+v2.^2);
