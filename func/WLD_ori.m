function Theta=WLD_ori(subImage)% 将方向映射到[0，2pi]区间

%     f3=[1,2,1;0,0,0;-1,-2,-1];
%     f4=[1,0,-1,2,0,-2,1,0,-1];
f3=[0,0,0;1,0,-1;0,0,0];
f4=[0,-1,0;0,0,0;0,1,0]; 
    v3=filter2(f3,subImage);
    v4=filter2(f4,subImage);
    [row,col]=size(v3);
    Fai=zeros(1,12);
    for i=1:row
        for j=1:col
            Theta(i,j)=atan(v3(i,j)/v4(i,j));
            if v3(i,j)>0 && v4(i,j)>0
                ;
            elseif v3(i,j)>0 && v4(i,j)<0
                Theta(i,j)=Theta(i,j)+2*pi;
            else
                Theta(i,j)=Theta(i,j)+pi;
            end
            Theta(i,j)=classifyFai(Theta(i,j));
        end
    end

