function imgshizhi=maxConnectionArea(img)
%最大连通分量的提取
%II为输入二值图像，OI为输出图像
    L=bwlabel(img,4);
    imgshizhi=img;
    stats = regionprops(L);
    Ar = cat(1, stats.Area);
    ind=find(Ar==max(Ar));
    imgshizhi(L~=ind)=0;%将其他区域置为0
%     ind = find(Ar<1000);
%     s=size(ind,1);
%     for i=1:s
%         OI(L==ind(i))=0;%将其他区域置为0
%     end    
end