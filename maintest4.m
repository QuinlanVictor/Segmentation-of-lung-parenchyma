clc;clear;
folder_name_all = uigetdir('');%选择文件夹
img_path_list = dir(strcat(folder_name_all,'\','*.dcm'));% 获取该文件夹中所有格式的图像  
img_num = length(img_path_list); %获取图像总数量 
%逐一读取图像
mkdir img;%创建保存图像的文件夹
for i = 1:img_num
     image_name = img_path_list(i).name;  %  图像名
     Vol(:,:,i) = dicomread(strcat(folder_name_all,'\',image_name));
     img=Vol(:,:,i);
     img1=mat2gray(img);%归一化操作
     level=graythresh(img1);%取阈值，大津阈值算法
     bw=imbinarize(img1,level);%二值化
     % figure;imshow(bw);
     bw=~bw;%取反
     se=strel('disk',3);
     bw1=imclose(bw,se);%闭运算
     bw1=~bw1;%取反
     bw1=maxConnectionArea(bw1);%获取最大连通区域
     bw2=imfill(bw1,'holes');%孔洞填充
     bw1=bw2-bw1;%掩膜相减
     bw1=deleteConnectionArea(bw1,1000);%剔除面积小于1000的区域
     imgshizhi=bw1.*double(img1);%获取肺实质图像
     figure;imshow(imgshizhi,[]);
     imgname=sprintf('%d.jpg',i);

     saveas(gcf,['img\',imgname]);
    
 end
