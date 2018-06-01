function y=histhog1(Grf,IndTagf,dr)%这个函数用于统计每个梯度方向上的幅值之和
[L1,L2]=size(Grf);temp=zeros(1,dr);%L1与L2分别为每单元格cell行与列数
                for i=1:L1
                    for j=1:L2
                        
                        if IndTagf(i,j)==1
                            temp(1,1)=temp(1,1)+Grf(i,j);
                        end
                        if IndTagf(i,j)==2
                            temp(1,2)=temp(1,2)+Grf(i,j);
                        end
                        if IndTagf(i,j)==3
                            temp(1,3)=temp(1,3)+Grf(i,j);
                        end
                        if IndTagf(i,j)==4
                            temp(1,4)=temp(1,4)+Grf(i,j);
                        end
                        if IndTagf(i,j)==5
                            temp(1,5)=temp(1,5)+Grf(i,j);
                        end
                        if IndTagf(i,j)==6
                            temp(1,6)=temp(1,6)+Grf(i,j);
                        end
                        if IndTagf(i,j)==7
                            temp(1,7)=temp(1,7)+Grf(i,j);
                        end
                        if IndTagf(i,j)==8
                            temp(1,8)=temp(1,8)+Grf(i,j);
                        end
                        if IndTagf(i,j)==9
                            temp(1,9)=temp(1,9)+Grf(i,j);
                        end
                        if IndTagf(i,j)==10
                            temp(1,10)=temp(1,10)+Grf(i,j);
                        end
                        if IndTagf(i,j)==11
                            temp(1,11)=temp(1,11)+Grf(i,j);
                        end
                        if IndTagf(i,j)==12
                            temp(1,12)=temp(1,12)+Grf(i,j);
                        end
%                         if IndTagf(i,j)==13
%                             temp(1,13)=temp(1,13)+Grf(i,j);
%                         end
%                         if IndTagf(i,j)==14
%                             temp(1,14)=temp(1,14)+Grf(i,j);
%                         end
%                         if IndTagf(i,j)==15
%                             temp(1,15)=temp(1,15)+Grf(i,j);
%                         end
%                         if IndTagf(i,j)==16
%                             temp(1,16)=temp(1,16)+Grf(i,j);
%                         end
%                         if IndTagf(i,j)==17
%                             temp(1,17)=temp(1,17)+Grf(i,j);
%                         end
%                         if IndTagf(i,j)==18
%                             temp(1,18)=temp(1,18)+Grf(i,j);
%                         end
                    end
                end
                y=temp;
                