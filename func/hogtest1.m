function y=hogtest1(x,n,m,dr)
Angle=180;
nAngle=Angle/dr;%�ݶȷ�����ֳ�dr��
xx=n*m;%�ֿ���ܿ���
[Gr,A]=gradient_angle(x,Angle);%����x���ݶ�����ȣ�Gr���ȷ��򣨸о�Ӧ�����ݶȷ�ֵ�ɣ�)��AΪ�ݶȷ���
IndTag = ceil(A./nAngle); %floor(x) ,ȡ������x���������,ceil��������������С�ڸ���ʵ������С����
Grf=submat1(Gr,n,m);
IndTagf=submat1(IndTag,n,m); 
%����(nm)����Ԫ��cell��ÿ����ԪΪ����������/n��*����������/m���ľ���
%
        y=[];
        for k=1:xx
            temp=histhog1(Grf{1,k},IndTagf{1,k},dr);
%             temp=temp./(sqrt(sum(temp.^2))+0.001); %L2-norm��׼��
            y=[y,temp];
        end
