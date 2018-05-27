clear;
clc;
load ar_light_data

group_num=100;
group_member=4;

max_train_num=1;
GaussianSize=[3 3];
Sigma=1;

f1=[1,1,1;1,-8,1;1,1,1];
f2=[0,0,0;0,1,0;0,0,0];
f3=[1,2,1;0,0,0;-1,-2,-1];
f4=[1,0,-1,2,0,-2,1,0,-1];

[row, col]=size(ar_light_data{1,1});

sub_image_size=[4 2];

g_template= fspecial('gaussian',GaussianSize,Sigma);
width=max(sub_image_size);  
subw_n=ceil(row/sub_image_size(1));
subh_n=ceil(col/sub_image_size(2));
for train_num=1:max_train_num
    test_num=group_member-train_num;   
     for i=1:group_num
        Hdtemp=zeros((subw_n*subh_n)+(subw_n-2)*(subh_n-2)*(width-1),96);
        for j=1:group_member
            hrows=1;
            tmpImg(1:row,1:col)=ar_light_data{i,j};
            tmpImg=filter2(g_template,tmpImg)/255;          
            fprintf('Dealing with %d group No.%d image...\r\n',i,j);
            for ni=1:subw_n
                for nj=1:subh_n
                    if (ni~=1 && nj~=1 && ni~=subw_n && nj~=subh_n)       
                        for nk=1:width
                            if nk>sub_image_size(1)  
                                subr=sub_image_size(1);
                            else
                                subr=nk;
                            end

                            if nk>sub_image_size(2)
                                subc=sub_image_size(2);
                            else
                                subc=nk;
                            end
                            sub_rows=sub_image_size(1)+2*subr;
                            sub_cols=sub_image_size(2)+2*subc;
                            left_row=(ni-1)*sub_image_size(1)-subr+1;
                            right_row=ni*sub_image_size(1)+subr;    
                            left_col=(nj-1)*sub_image_size(2)-subc+1;
                            right_col=nj*sub_image_size(2)+subc;
                            subImage=tmpImg(left_row:right_row,left_col:right_col);
                            H(hrows,:)=WLD(subImage(:,:));
                            hrows=hrows+1;
                        end
                    else
                        left_row=(ni-1)*sub_image_size(1)+1;
                        right_row=ni*sub_image_size(1);
                        left_col=(nj-1)*sub_image_size(2)+1;
                        right_col=nj*sub_image_size(2);
                        subImage=tmpImg(left_row:right_row,left_col:right_col);
                        H(hrows,:)=WLD(subImage(:,:));
                        hrows=hrows+1;
                    end
                    
                end
            end
            
            if j<=train_num
                Hdtemp=Hdtemp+H;  
            else
                H0(i,j-train_num,:,:)=H;
            end 
        end
        Hd(i,:,:)= (Hdtemp/train_num);  
    end 

    totalInf=zeros(max_train_num,group_member);
    for i=1:group_num
        info=zeros(1,test_num); 
        s=0;
        for j=1:test_num
            m=Inf;
            for k=1:group_num
                sd=chi_square_dis(Hd(k,:,:),H0(i,j,:,:));
                if sd<m 
                    m=sd;
                    MinIndex=k;
                end
            end
            if MinIndex==i 
                info(j)=1;
                s=s+1;
            end
        end 
        totalInf(train_num,i)=s/test_num; 
        fprintf('Recongnizing %dth group,s=%d\r\n',i,totalInf(train_num,i));
    end 
end
disp(totalInf(:,:));  
