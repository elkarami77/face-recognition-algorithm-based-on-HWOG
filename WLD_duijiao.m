function h1d = WLD_duijiao(image,Ebin,Obin,Sbin)

Excitation=WLD_chali(image);
Orientation=WLD_duiori(image);  %已经映射到[0,2pi]区间后的方向值
M = Ebin; % for excitation, 6 if omitted
T = Obin; % for orientation, 8 if omitted
S = Sbin; % number of bins in subhistogram
C = M*S;

Cval = -pi/2:pi/C:pi/2; % Excitation
Cvalcen = (Cval(1:end-1)+Cval(2:end))/2;

Tval = 0:360/T:360; % Orientation

h2d = zeros(C,T);
for i = 1:T
    if i>1
        temp = Excitation(Orientation>Tval(i)&Orientation<=Tval(i+1));
    else
        temp = Excitation(Orientation>=Tval(i)&Orientation<=Tval(i+1));
    end
    h2d(:,i) = hist(temp,Cvalcen);
end

h = h2d';
h = reshape(h,[T,S,M]);  %按列重新划分矩阵
temph = []; % final 1d histogram
for j = 1:M;
    temp = h(:,:,j);temp=temp';
    temph = [temph; temp(:)];
end
h1d = temph';

