clc
clear all
close all hidden
cNum=15;%类的总数
load yale_data
fperc=11;%每类的人脸数
n=13;m=13;%分块数
NumTarget  =  cNum*fperc;
db_ncst=[];
tic
for cN=1:cNum
    for fp=1:fperc
        y=[];
        disp((cN-1)*fperc+fp)
        baseimage=yale_data{cN,fp};
        y=[y,oHog(baseimage,n,m)];
        len=size(y,2);
        db_ncst((cN-1)*11+fp,:)=y;
    end
end 
toc

 groups=[];				%分类的标记，也就是给每个人的所有图片做一个一样的标记，比如第一个人的为1，第二个人的为2.。。。
 for ii=1:cNum
         groups=[groups,ones(1,fperc)*ii];
 end
 
result=zeros(1,50);
 x=1; 
 for xx=1:50
%                  disp(xx)
                 for fftr=2
                 disp(xx)
                 disp(fftr)    

             dben = fftr;  %单个人的训练样本数
             yzong  = dben*cNum;   %训练的照片总数
             xzong  =NumTarget - yzong; %测试的照片总数        
            [test, train] = crossvalind('holdOut',groups,fftr/fperc);

 feature_gallery_matrix=db_ncst(train,:);          %根据train取出训练集中所有人脸的特征数据
 train_data_labels=groups(train);       %根据train取出训练集中所有人脸对应的标记
 feature_probe_matrix=db_ncst(test,:);		%根据test取出测试所有人脸的特征数据
 test_data_labels=groups(test);         %根据test取出测试集中所有人脸的特征数据

  g_f=feature_gallery_matrix(:,1:len);% 取gallery的特征矩阵
  p_f=feature_probe_matrix(:,1:len);% 取probe的特征矩阵

   test_accuracy_1=knn_my(train_data_labels,test_data_labels,g_f,p_f);


             disp(test_accuracy_1)
             result(1,xx)=test_accuracy_1;
                 end
 end

toc

  