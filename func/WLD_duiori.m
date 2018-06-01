function theta2=WLD_duiori(subImage)
   f3=[0,0,1;0,0,0;-1,0,0];
   f4=[1,0,0;0,0,0;0,0,-1];
   EPSILON = 0.0000001;
    v3=filter2(f3,subImage);
    v4=filter2(f4,subImage);
    [row,col]=size(v3);
    for i=1:row
        for j=1:col
            theta(i,j)=atan(v3(i,j)/v4(i,j));
        end
    end
    theta(abs(v4)<EPSILON) = 0;
    theta = theta*180/pi;
    theta2 = zeros(size(theta));

    set1 = find(v3 > EPSILON & v4 > EPSILON);
    set2 = find(v3 < -EPSILON & v4> EPSILON);
    set3 = find(v3 < -EPSILON & v4 < -EPSILON);
    set4 = find(v3 > EPSILON & v4 < -EPSILON);

    theta2(set1) = theta(set1);
    theta2(set2) = theta(set2)+180;
    theta2(set3) = theta(set3)+180;
    theta2(set4) = theta(set4)+360;


