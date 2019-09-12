function OI=deleteConnectionArea(II,S)
%最大连通分量的提取
%II为输入二值图像，OI为输出图像
    L=bwlabel(II,4);
    OI=II;
    stats = regionprops(L);
    Ar = cat(1, stats.Area);
    ind = find(Ar<S);
    x=size(ind,1);
    for i=1:x
        OI(L==ind(i))=0;%将其他区域置为0
    end    
end