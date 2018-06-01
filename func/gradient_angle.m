function [Gr,A]=gradient_angle(Img,Angle)
 filter_para=[0,0];
 filter_hsize=filter_para(1);%filer_hsize=0
 filter_delta=filter_para(2);%filer_delta=0
%% Gamma/Colour Normalization
if size(Img,3) == 3
    % size（）：获取矩阵的行数和列数
    %（1）s=size(A),
    %当只有一个输出参数时，返回一个行向量，该行向量的第一个元素时矩阵的行数，第二个元素是矩阵的列数。
    %（2）[r,c]=size(A),
    %当有两个输出参数时，size函数将矩阵的行数返回到第一个输出变量r，将矩阵的列数返回到第二个输出变量c。
    %（3）size(A,n)如果在size函数的输入参数中再添加一项n，并用1或2为n赋值，
    %则 size将返回矩阵的行数或列数。其中r=size(A,1)该语句返回的时矩阵A的行数， c=size(A,2) 该语句返回的时矩阵A的列数
    G = rgb2gray(Img); %灰度化
else
    G = Img;
end

[height, width] = size(G);

%% Gradient and Gradient angle Computation
if filter_hsize == 0
    [GradientX,GradientY] = gradient(double(G));
else
    h=fspecial('gaussian', filter_hsize, filter_delta);
    [GradientX, GradientY] = HOGGradient(double(G));
end
% calculate the norm of gradient
Gr = sqrt(GradientX.^2+GradientY.^2);%梯度幅值
% Calculate the angle
index = find(GradientX == 0);
GradientX(index) = 1e-5;
YX = GradientY./GradientX;       %以下为计算梯度方向
if Angle == 180
    A = ((atan(YX)+(pi/2))*180)./pi; %这里把atan（YX）从0~1的范围变为了0~255的范围
end
if Angle == 360
    A = ((atan2(GradientY,GradientX)+pi).*180)./pi; 
end
