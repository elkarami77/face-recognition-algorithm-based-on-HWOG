clc
clear all
close all hidden
cNum=15;%类的总数
 load yale_data    %%5*5分块
 %load orl_data       %%3*3
% load ar_light_data
 %load ar_expre_data         %ar人脸库共计50位男性，50为女性，每人26张，合计2600张
%load ar_zhedang_A_data
% load ar_zhedang_B_data
% load caslight1_data
% result1=zeros(13,13);
fperc=11;%每类的人脸数
% for a=1:5
n=5;
m=5;%分块数
for m1=1;
    for  n1=1;
xx=m*n;
sigma=0.8;
GaussianSize=[3,3];
NumTarget  =  cNum*fperc;
db_ncst=[];
tic
g_template= fspecial('gaussian',GaussianSize,sigma);
for cN=1:cNum
    for fp=1:fperc
        y=[];
        y1=[];
        y2=[];
        disp((cN-1)*fperc+fp)
       base=yale_data{cN,fp};
%         base=orl_data{cN,fp};
%         base=ar_expre_data{cN,fp};
%         base=ar_light_data{cN,fp};
%         base=ar_zhedang_A_data{cN,fp};
%         base=ar_zhedang_B_data{cN,fp};
%         base=caslight1_data{cN,fp};
        baseimage=filter2(g_template,base);   
        kuai=submat1(baseimage,m,n);
        for i=1:xx
          y1=[y1,WLD_duijiao(kuai{1,i},6,8,10)];
        end
          y2=[y2,oHog(baseimage,n1,m1)];
          y=[y,y1,y2];
        len=size(y,2);
        db_ncst((cN-1)*fperc+fp,:)=y;
    end
end 
toc

 groups=[];				%分类的标记，也就是给每个人的所有图片做一个一样的标记，比如第一个人的为1，第二个人的为2.。。。
 for ii=1:cNum
         groups=[groups,ones(1,fperc)*ii];
 end
 
% result=zeros(1,50);
 x=1; 
 for xx=1:1
%                  disp(xx)
                 for fftr=2
                 disp(xx)
                 disp(fftr)    

             dben = fftr;  %单个人的训练样本数
             yzong  = dben*cNum;   %训练的照片总数
             xzong  =NumTarget - yzong; %测试的照片总数        
            [test, train] = crossvalind('holdOut',groups,fftr/fperc);
test(:,1)= logical(true);
 train(:,1)= logical(false);
for ir=1:cNum
    for iw =1:fftr
         train(((ir-1)*fperc+iw),1)=logical(true);
    end    
        for iy =(fftr+1):fperc
                   test(((ir-1)*fperc+iy),1)=logical(true);
        end  
end    
% for ir=1:cNum
%     for iw =fftr
%          train(((ir-1)*fperc+iw),1)=logical(true);
%     end    
%         for iy =fftr
%                    test(((ir-1)*fperc+iy),1)=logical(false);
%         end  
% end    


 feature_gallery_matrix=db_ncst(train,:);          %根据train取出训练集中所有人脸的特征数据
 train_data_labels=groups(train);       %根据train取出训练集中所有人脸对应的标记
 feature_probe_matrix=db_ncst(test,:);		%根据test取出测试所有人脸的特征数据
 test_data_labels=groups(test);         %根据test取出测试集中所有人脸的特征数据

  g_f=feature_gallery_matrix(:,1:len);% 取gallery的特征矩阵
  p_f=feature_probe_matrix(:,1:len);% 取probe的特征矩阵
k=1;
   test_accuracy_1=knn_my(train_data_labels,test_data_labels,g_f,p_f,k);


             disp(test_accuracy_1)
%              result(1,xx)=test_accuracy_1;
              
                 end
 end
%             meanresult=mean(result);
%             result1(m1,n1)=meanresult;
toc
   end
end
