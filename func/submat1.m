function y=submat1(imx_x,blockr,blockc)
[m,n]=size(imx_x);
    for ii=1:blockr
        for jj=1:blockc
           bsx=round((m/blockr)*(ii-1)+1);bsy=round((n/blockc)*(jj-1)+1);
           bex=round((m/blockr)*ii);      bey=round((n/blockc)*jj);
           Ib=imx_x(bsx:bex,bsy:bey);
           y{(ii-1)*blockc+jj}=Ib;
        end
    end