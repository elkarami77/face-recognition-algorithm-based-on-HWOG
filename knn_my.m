function [ test_accuracy_1 ] = knn_my(train_data_labels,test_data_labels,g_f,p_f,k)
%KNN_MY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% load ar_zhedang_B_data

  for i=1:size(p_f,1)
    for j=1:size(g_f,1)
        intersection=min(g_f(j,:),p_f(i,:));
        temp=sum(intersection);
        matrix_intersection(i,j)=temp;
    end
end
%     figure
    counts_match=0;% ����ͳ��ʶ��ɹ�������
 for i=1:size(p_f,1)% ����ͼƬ����
     [max_value,R_lable]=max(matrix_intersection(i,:));% ��ÿһ��probe������gallery�����ƶȵ����ֵ��R_lableΪ��Ӧ�ĵ�i��probe��gallery�����
         if train_data_labels(R_lable)==test_data_labels(i)
               counts_match=counts_match+1;% ʶ��ɹ������ۼ�
         end
 end
%  [datarow,datacol]=size(g_f);
% for i=1:size(p_f,1)
%     inx=p_f(i,:);
%     diffMat = repmat(inx,[datarow,1])-g_f;
%     distanceMat = sqrt(sum(diffMat.^2,2));
%     [B,IX]=sort(distanceMat,'ascend');
%     len = min(k,length(B));
%     resultLabel=mode(train_data_labels(IX(1:len)));
%     if(resultLabel==test_data_labels(i))
%        counts_match =counts_match+1;
%     end
% end
%                %%%%%%%%%%��֤ʶ�����Դ�
%           mx=ceil(i/3);
%           tt=mod(i,3);
%           if tt==0;
%              tt=3;
%           end
%          my=tt+1;
%          w=R_lable;
%          t=1;
%          gallery_a=ar_zhedang_B_data{w,t};
%          gallery_b=ar_zhedang_B_data{mx,my};  
%         subplot(1,2,1),imshow(uint8(gallery_a)),title('ʶ����ȷ��������');
%         subplot(1,2,2),imshow(uint8(gallery_b)),title('ʶ����ȷ--ѵ��');
%     
%                %%%%%%%%%%
%          else
%           mx=ceil(i/3);          
%           tt=mod(i,3);
%           if tt==0;
%              tt=3;
%           end
%          my=tt+1;
%          w=R_lable;
%          t=1;
%          gallery_a=ar_zhedang_B_data{w,t};
%          gallery_b=ar_zhedang_B_data{mx,my};  
%         subplot(1,2,1),imshow(uint8(gallery_a)),title('������󡪡�����');
%         subplot(1,2,2),imshow(uint8(gallery_b)),title('�������--ѵ��');
%                          
        % end
%       ff=2;  

        
%      if  G_ID.gallery_num_ID(R_lable)==P_ID.probe_num_ID(i)% ��������ƶȵ�����ͼƬ����ͬ����ID��ʱ����Ϊʶ��ɹ�
%          counts_match=counts_match+1;% ʶ��ɹ������ۼ�
% %          fprintf('ʶ���gallery ID : %d\n',G_ID.gallery_num_ID(R_lable));
% %          fprintf('ʶ���probe   ID ��%d\n',P_ID.probe_num_ID(i));
%      else
%          disp(' ')
%          disp('***********************************************************')
%          fprintf('ʶ������gallery ID : %d\n',G_ID.gallery_num_ID(R_lable));
%          fprintf('ʶ������probe   ID ��%d\n',P_ID.probe_num_ID(i));
%          disp('***********************************************************')
%          disp(' ')
%      end
 test_accuracy_1=counts_match/size(p_f,1);


end

