function  y=oHog(x,m,n)
ori=WLD_ori(x);  %求韦伯梯度方向返回T值矩阵
re=ori_gradient(x);  % 梯度幅值
Grf=submat1(re,n,m);
IndTagf=submat1(ori,n,m); 
%生成(nm)个单元格cell，每个单元为（行总像素/n）*（列总像素/m）的矩阵
%
xx=m*n;
dr=12;
        y=[];
        for k=1:xx
            temp=histhog1(Grf{1,k},IndTagf{1,k},dr);
%             temp=temp./(sqrt(sum(temp.^2))+0.001); %L2-norm标准化
            y=[y,temp];
        end

