clc;clear;
folder_name_all = uigetdir('');%ѡ���ļ���
img_path_list = dir(strcat(folder_name_all,'\','*.dcm'));% ��ȡ���ļ��������и�ʽ��ͼ��  
img_num = length(img_path_list); %��ȡͼ�������� 
%��һ��ȡͼ��
mkdir img;%��������ͼ����ļ���
for i = 1:img_num
     image_name = img_path_list(i).name;  %  ͼ����
     Vol(:,:,i) = dicomread(strcat(folder_name_all,'\',image_name));
     img=Vol(:,:,i);
     img1=mat2gray(img);%��һ������
     level=graythresh(img1);%ȡ��ֵ�������ֵ�㷨
     bw=imbinarize(img1,level);%��ֵ��
     % figure;imshow(bw);
     bw=~bw;%ȡ��
     se=strel('disk',3);
     bw1=imclose(bw,se);%������
     bw1=~bw1;%ȡ��
     bw1=maxConnectionArea(bw1);%��ȡ�����ͨ����
     bw2=imfill(bw1,'holes');%�׶����
     bw1=bw2-bw1;%��Ĥ���
     bw1=deleteConnectionArea(bw1,1000);%�޳����С��1000������
     imgshizhi=bw1.*double(img1);%��ȡ��ʵ��ͼ��
     figure;imshow(imgshizhi,[]);
     imgname=sprintf('%d.jpg',i);

     saveas(gcf,['img\',imgname]);
    
 end
