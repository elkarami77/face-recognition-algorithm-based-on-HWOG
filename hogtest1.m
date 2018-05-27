function y=hogtest1(x,n,m,dr)
Angle=180;
nAngle=Angle/dr;%梯度方方向分成dr份
xx=n*m;%分块的总块数
[Gr,A]=gradient_angle(x,Angle);%计算x的梯度与幅度，Gr幅度方向（感觉应该是梯度幅值吧！)，A为梯度方向
IndTag = ceil(A./nAngle); %floor(x) ,取不大于x的最大整数,ceil函数的作用是求不小于给定实数的最小整数
Grf=submat1(Gr,n,m);
IndTagf=submat1(IndTag,n,m); 
%生成(nm)个单元格cell，每个单元为（行总像素/n）*（列总像素/m）的矩阵
%
        y=[];
        for k=1:xx
            temp=histhog1(Grf{1,k},IndTagf{1,k},dr);
%             temp=temp./(sqrt(sum(temp.^2))+0.001); %L2-norm标准化
            y=[y,temp];
        end
