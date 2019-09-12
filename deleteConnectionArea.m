function OI=deleteConnectionArea(II,S)
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
