function [ test_accuracy_1 ] = knn_my(train_data_labels,test_data_labels,g_f,p_f,k)
%KNN_MY 此处显示有关此函数的摘要
%   此处显示详细说明
% load ar_zhedang_B_data

  for i=1:size(p_f,1)
    for j=1:size(g_f,1)
        intersection=min(g_f(j,:),p_f(i,:));
        temp=sum(intersection);
        matrix_intersection(i,j)=temp;
    end
end
%     figure
    counts_match=0;% 用于统计识别成功的张数
 for i=1:size(p_f,1)% 测试图片张数
     [max_value,R_lable]=max(matrix_intersection(i,:));% 求每一张probe和所有gallery的相似度的最大值，R_lable为对应的第i张probe的gallery的序号
         if train_data_labels(R_lable)==test_data_labels(i)
               counts_match=counts_match+1;% 识别成功次数累加
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
%                %%%%%%%%%%验证识别结果对错
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
%         subplot(1,2,1),imshow(uint8(gallery_a)),title('识别正确——测试');
%         subplot(1,2,2),imshow(uint8(gallery_b)),title('识别正确--训练');
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
%         subplot(1,2,1),imshow(uint8(gallery_a)),title('错误错误——测试');
%         subplot(1,2,2),imshow(uint8(gallery_b)),title('错误错误--训练');
%                          
        % end
%       ff=2;  

        
%      if  G_ID.gallery_num_ID(R_lable)==P_ID.probe_num_ID(i)% 当最大相似度的两张图片具有同样的ID的时候，认为识别成功
%          counts_match=counts_match+1;% 识别成功次数累加
% %          fprintf('识别的gallery ID : %d\n',G_ID.gallery_num_ID(R_lable));
% %          fprintf('识别的probe   ID ：%d\n',P_ID.probe_num_ID(i));
%      else
%          disp(' ')
%          disp('***********************************************************')
%          fprintf('识别错误的gallery ID : %d\n',G_ID.gallery_num_ID(R_lable));
%          fprintf('识别错误的probe   ID ：%d\n',P_ID.probe_num_ID(i));
%          disp('***********************************************************')
%          disp(' ')
%      end
 test_accuracy_1=counts_match/size(p_f,1);


end

