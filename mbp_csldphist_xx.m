function hist_output = mbp_csldphist_xx( result,ints )
%MBP_CSLDPHIST �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 k_x    = 6;
 k_y    = 6;
 bins = ints.tezheng;
 my_size=size(result);% ��ȡ������ͼƬ�Ĵ�С

m_x=rem(my_size(2),k_x);% x�����ĳ���
m_y=rem(my_size(1),k_y);% y�����ĳ���
m_a=round(m_x/2);
m_b=round(m_y/2);
result_temp=result((m_b+1):(my_size(1)-(m_y-m_b)),(m_a+1):(my_size(2)-(m_x-m_a)));

%result_temp=result(3:98,3:98);% Ϊ�˷���ֿ飬��ͼƬ����Ϊ96*96�Ĵ�С������ͼ��Ϊ100*100��


result=result_temp;
% imshow(uint8(result)) % ��ʾ������

%% ����
% �Խ�����о��⻯���������������ȵ�����
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
 %%   ��ȡֱ��ͼ  256*16������
%k=4;
aa=cell(k_y,k_x);% ����Ԫ�������ڱ�����   
I_size_f=size(result);% ��ȡ������ͼƬ�Ĵ�С
%disp('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')
%fprintf('result : %d',I_size_f);
wi=I_size_f(2)/k_x;% x��ķֿ鳤��
wj=I_size_f(1)/k_y;% y��ķֿ鳤��
%disp('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')
%fprintf('wi:%d\n',wi);
kuai_image_f=cell(k_y,k_x);
image_f=cell(k_y,k_x);% ���ڱ�����
for j=1:k_y               
    for i=1:k_x
        %for m=1:(k+1).^2
        aa{j,i}=[((j-1)*wj+1) ((i-1)*wi+1)];% �ҵ�ÿһ��С��Ŀ�ʼ����
    end
end
% for i=1:k_x*k_y
%     kuai_image_f{i}=result(aa{i}(2):aa{i}(2)+wi-1,aa{i}(1):aa{i}(1)+wi-1);% ��ȡÿһС��
% end
for i=1:k_y               
    for j=1:k_x
    kuai_image_f{i,j}=result(aa{i,j}(1):aa{i,j}(1)+wj-1,aa{i,j}(2):aa{i,j}(2)+wi-1);% ��ȡÿһС��
    end
end


% for i=1:k_x*k_y
%    % hist(kuai_image_f{i}(:),0:(bins-1));
%     image_f{i}=hist(kuai_image_f{i}(:),0:(bins-1));% ��ȡÿһ��С���ֱ��ͼ��Ҳ�������������ܵ�ͼƬ��������������ΪÿһС���������������*�ֿ���Ŀ����Ϊ���õ��Ǵ��ӵķ�ʽ
% end
for i=1:k_y               
    for j=1:k_x
   image_f{i,j}=hist(kuai_image_f{i,j}(:),0:(bins-1));% ��ȡÿһ��С���ֱ��ͼ��Ҳ�������������ܵ�ͼƬ��������������ΪÿһС���������������*�ֿ���Ŀ����Ϊ���õ��Ǵ��ӵķ�ʽ

    end
end

%hist_output=image_f; % ���Ϊһ��4*4��Ԫ���ṹ����������
%%  �������ֱֵ��ͼ


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