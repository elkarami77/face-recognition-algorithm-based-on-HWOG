function  y=oHog(x,m,n)
ori=WLD_ori(x);  %��Τ���ݶȷ��򷵻�Tֵ����
re=ori_gradient(x);  % �ݶȷ�ֵ
Grf=submat1(re,n,m);
IndTagf=submat1(ori,n,m); 
%����(nm)����Ԫ��cell��ÿ����ԪΪ����������/n��*����������/m���ľ���
%
xx=m*n;
dr=12;
        y=[];
        for k=1:xx
            temp=histhog1(Grf{1,k},IndTagf{1,k},dr);
%             temp=temp./(sqrt(sum(temp.^2))+0.001); %L2-norm��׼��
            y=[y,temp];
        end

