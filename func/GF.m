function A_r = GF(X,sigma)
%clc
% X=imread('33.pgm');
X=uint8(X);
% sigma=1;
normalize = 1;
%theta = 3*pi/4;
Y=[];all=[];


[a,b]=size(X);
X1=normalize8(X); 
% X1=double(X);
%% Gaussian smoothing
%
%F = fspecial('gaussian',2*ceil(3*sigma)+1,sigma);
%XF  = imfilter(X1,F,'replicate','same');

%}
%% Construct derivatives of Gaussians in x and y directions
Wx = floor((7/2)*sigma); 
if Wx < 1
   Wx = 1;
end

Wy = floor((7/2)*sigma); 
if Wy < 1
   Wy = 1;
end
[Xw,Yw]=meshgrid(-Wy:Wy,-Wx:Wx);

Gx = -2.*Xw.*exp(-(Xw.^2+Yw.^2)./(2*sigma^2));
Gy = -2.*Yw.*exp(-(Xw.^2+Yw.^2)./(2*sigma^2));
GradientX=imfilter(X1,Gy,'replicate','same');
GradientY=imfilter(X1,Gx,'replicate','same');
A_r= sqrt(GradientX.^2+GradientY.^2);
% A_r=A./(X+1);
Y = atan2(imfilter(X1,Gy,'replicate','same'),imfilter(X1,Gx,'replicate','same'));

% imshow(Y,[])


