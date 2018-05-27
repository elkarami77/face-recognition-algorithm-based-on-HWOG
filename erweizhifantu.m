%  二维彩色直方图
% load m_csgmp_cas_3.mat
meanresult=result1;
Z=meanresult*100;
 h=bar3(Z); 
for i = 1:length(h)
    zdata = ones(6*length(h),4);
    k = 1;
    for j = 0:6:(6*length(h)-6)
        zdata(j+1:j+6,:) = Z(k,i);
        k = k+1;
    end
    set(h(i),'Cdata',zdata)
end
colormap jet  %cool
colorbar
 %%

% load m_csgmp_ar_4
% meanresult=result_4;
% A=meanresult;
% a=max(max(A))
% [r,c]=find(A==a)