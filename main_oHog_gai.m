clc
clear all
close all hidden
cNum=15;%�������
load yale_data
fperc=11;%ÿ���������
n=13;m=13;%�ֿ���
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

 groups=[];				%����ı�ǣ�Ҳ���Ǹ�ÿ���˵�����ͼƬ��һ��һ���ı�ǣ������һ���˵�Ϊ1���ڶ����˵�Ϊ2.������
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

             dben = fftr;  %�����˵�ѵ��������
             yzong  = dben*cNum;   %ѵ������Ƭ����
             xzong  =NumTarget - yzong; %���Ե���Ƭ����        
            [test, train] = crossvalind('holdOut',groups,fftr/fperc);

 feature_gallery_matrix=db_ncst(train,:);          %����trainȡ��ѵ������������������������
 train_data_labels=groups(train);       %����trainȡ��ѵ����������������Ӧ�ı��
 feature_probe_matrix=db_ncst(test,:);		%����testȡ������������������������
 test_data_labels=groups(test);         %����testȡ�����Լ���������������������

  g_f=feature_gallery_matrix(:,1:len);% ȡgallery����������
  p_f=feature_probe_matrix(:,1:len);% ȡprobe����������

   test_accuracy_1=knn_my(train_data_labels,test_data_labels,g_f,p_f);


             disp(test_accuracy_1)
             result(1,xx)=test_accuracy_1;
                 end
 end

toc

  