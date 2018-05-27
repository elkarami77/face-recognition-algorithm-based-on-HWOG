load yale_data
% image=yale_data{1,1};
% result=WLD_gai(image);
image=imread('s_2_9.bmp');
% aa=GF(image,0.1);
image(1,1)=0;
% [Gr,A]=gradient_angle(image,180);
m=11;
n=11;
chali=WLD_chali(image);
duiori=WLD_duiori(image);
ori=WLD_ori(image);
re=ori_gradient(image);
y=oHog(image,m,n);