function a=WLD_gai(subImage)
    f1=[1,1,1;1,-8,1;1,1,1];
    f2=[0,0,0;0,1,0;0,0,0];

    v1=filter2(f1,subImage);
    v2=filter2(f2,subImage);
    [row,col]=size(v1);
    for i=1:row
        for j=1:col
            a(i,j)=v1(i,j)/v2(i,j);
        end
    end