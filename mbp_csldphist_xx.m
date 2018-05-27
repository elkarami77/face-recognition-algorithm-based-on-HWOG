function hist_output = mbp_csldphist_xx( result,ints )
%MBP_CSLDPHIST 此处显示有关此函数的摘要
%   此处显示详细说明
 k_x    = 6;
 k_y    = 6;
 bins = ints.tezheng;
 my_size=size(result);% 获取编码后的图片的大小

m_x=rem(my_size(2),k_x);% x轴多余的长度
m_y=rem(my_size(1),k_y);% y轴多余的长度
m_a=round(m_x/2);
m_b=round(m_y/2);
result_temp=result((m_b+1):(my_size(1)-(m_y-m_b)),(m_a+1):(my_size(2)-(m_x-m_a)));

%result_temp=result(3:98,3:98);% 为了方便分块，把图片剪裁为96*96的大小（输入图像为100*100）


result=result_temp;
% imshow(uint8(result)) % 显示编码结果

%% 不用
% 对结果进行均衡化，起到缩短特征长度的作用
%  if isstruct(mapping)
%      if(  56 == ints.tezheng)
%         for i = 1:size(result,1)
%           for j = 1:size(result,2)
%               result(i,j) = mapping.table(result(i,j)+1);
%           end
%         end
%      end
%  end
%  
 %%   获取直方图  256*16个特征
%k=4;
aa=cell(k_y,k_x);% 创建元胞，用于保存结果   
I_size_f=size(result);% 获取编码后的图片的大小
%disp('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')
%fprintf('result : %d',I_size_f);
wi=I_size_f(2)/k_x;% x轴的分块长度
wj=I_size_f(1)/k_y;% y轴的分块长度
%disp('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')
%fprintf('wi:%d\n',wi);
kuai_image_f=cell(k_y,k_x);
image_f=cell(k_y,k_x);% 用于保存结果
for j=1:k_y               
    for i=1:k_x
        %for m=1:(k+1).^2
        aa{j,i}=[((j-1)*wj+1) ((i-1)*wi+1)];% 找到每一个小块的开始坐标
    end
end
% for i=1:k_x*k_y
%     kuai_image_f{i}=result(aa{i}(2):aa{i}(2)+wi-1,aa{i}(1):aa{i}(1)+wi-1);% 获取每一小块
% end
for i=1:k_y               
    for j=1:k_x
    kuai_image_f{i,j}=result(aa{i,j}(1):aa{i,j}(1)+wj-1,aa{i,j}(2):aa{i,j}(2)+wi-1);% 获取每一小块
    end
end


% for i=1:k_x*k_y
%    % hist(kuai_image_f{i}(:),0:(bins-1));
%     image_f{i}=hist(kuai_image_f{i}(:),0:(bins-1));% 获取每一次小块的直方图，也即特征向量，总的图片的特征向量长度为每一小块的特征向量长度*分块数目，因为采用的是串接的方式
% end
for i=1:k_y               
    for j=1:k_x
   image_f{i,j}=hist(kuai_image_f{i,j}(:),0:(bins-1));% 获取每一次小块的直方图，也即特征向量，总的图片的特征向量长度为每一小块的特征向量长度*分块数目，因为采用的是串接的方式

    end
end

%hist_output=image_f; % 结果为一个4*4的元胞结构，并作返回
%%  组合特征值直方图


% feature_vector=zeros(1,bins*k_x*k_y);% the feature vector variant
% 
% % combination of the feature
% vector_lable=0;
% for i=1:k_x*k_y
%     for j=1:bins
%         vector_lable=vector_lable+1;
%         feature_vector(vector_lable)=image_f{i}(j);
%     end
% end



feature_vector=[];
for i=1:k_y
    for j=1:k_x
        feature_vector=[feature_vector image_f{i,j}];
%        for n=1:bins
%            vector_lable=vector_lable+1;
%            feature_vector(vector_lable)=lxor_image_hist{i,j}(n);
%        end
    end
end

 hist_output=feature_vector; 




end