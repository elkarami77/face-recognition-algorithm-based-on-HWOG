function [Gr,A]=gradient_angle(Img,Angle)
 filter_para=[0,0];
 filter_hsize=filter_para(1);%filer_hsize=0
 filter_delta=filter_para(2);%filer_delta=0
%% Gamma/Colour Normalization
if size(Img,3) == 3
    % size��������ȡ���������������
    %��1��s=size(A),
    %��ֻ��һ���������ʱ������һ�������������������ĵ�һ��Ԫ��ʱ������������ڶ���Ԫ���Ǿ����������
    %��2��[r,c]=size(A),
    %���������������ʱ��size������������������ص���һ���������r����������������ص��ڶ����������c��
    %��3��size(A,n)�����size��������������������һ��n������1��2Ϊn��ֵ��
    %�� size�����ؾ��������������������r=size(A,1)����䷵�ص�ʱ����A�������� c=size(A,2) ����䷵�ص�ʱ����A������
    G = rgb2gray(Img); %�ҶȻ�
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
Gr = sqrt(GradientX.^2+GradientY.^2);%�ݶȷ�ֵ
% Calculate the angle
index = find(GradientX == 0);
GradientX(index) = 1e-5;
YX = GradientY./GradientX;       %����Ϊ�����ݶȷ���
if Angle == 180
    A = ((atan(YX)+(pi/2))*180)./pi; %�����atan��YX����0~1�ķ�Χ��Ϊ��0~255�ķ�Χ
end
if Angle == 360
    A = ((atan2(GradientY,GradientX)+pi).*180)./pi; 
end
