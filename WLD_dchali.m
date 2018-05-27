function value1=WLD_dchali(subImage)
%用于计算H的矩阵?    
    f1=[1,1,1;1,-8,1;1,1,1];
    f2=[0,0,0;0,1,0;0,0,0];
%     f7=[1,1,1,1,1;1,0,0,0,1;1,0,-16,0,1;1,0,0,0,1;1,1,1,1,1];
%     f8=[0,0,0,0,0;0,0,0,0,0;0,0,1,0,0;0,0,0,0,0;0,0,0,0,0];
    f7=[0,0,1,0,0;0,1,2,1,0;1,2,-16,2,1;0,1,2,1,0;0,0,1,0,0];
    f8=[0,0,0,0,0;0,0,0,0,0;0,0,1,0,0;0,0,0,0,0;0,0,0,0,0];
    f9=[1,1,1,1,1,1,1;1,0,0,0,0,0,1;1,0,0,0,0,0,1;1,0,0,-24,0,0,1;1,0,0,0,0,0,1;1,0,0,0,0,0,1;1,1,1,1,1,1,1];
    f10=[0,0,0,0,0,0,0;0,0,0,0,0,0,0;0,0,0,0,0,0,0;0,0,0,1,0,0,0;0,0,0,0,0,0,0;0,0,0,0,0,0,0;0,0,0,0,0,0,0];
    v1=filter2(f1,subImage);%Y = filter2(h,X)返回图像X经算子h滤波后的结果，
    %默认返回图像Y与输入图像X大小相同
    v2=filter2(f2,subImage);
    v7=filter2(f7,subImage);
    v8=filter2(f8,subImage);
    v9=filter2(f9,subImage);
    v10=filter2(f10,subImage);
    [row, col]=size(v1);
    w1=0.5;
    w2=0.5;
    w3=0.5;
    for i=1:row
        for j=1:col
            a(i,j)=atan(v1(i,j)/v2(i,j));%计算a
        end
    end
     for i=1:row
        for j=1:col
            b(i,j)=atan(v7(i,j)/v8(i,j));%计算a
        end
    end
    for i=1:row
        for j=1:col
            c(i,j)=atan(v9(i,j)/v10(i,j));%计算a
        end
    end
    for i=1:row
        for j=1:col
            d(i,j)=w1*a(i,j)+w2*b(i,j)+w3*c(i,j);%计算a
        end
    end
    value1=d;