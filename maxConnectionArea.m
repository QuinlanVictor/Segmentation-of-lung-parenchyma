function imgshizhi=maxConnectionArea(img)
%�����ͨ��������ȡ
%IIΪ�����ֵͼ��OIΪ���ͼ��
    L=bwlabel(img,4);
    imgshizhi=img;
    stats = regionprops(L);
    Ar = cat(1, stats.Area);
    ind=find(Ar==max(Ar));
    imgshizhi(L~=ind)=0;%������������Ϊ0
%     ind = find(Ar<1000);
%     s=size(ind,1);
%     for i=1:s
%         OI(L==ind(i))=0;%������������Ϊ0
%     end    
end