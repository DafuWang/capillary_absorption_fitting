% imcrop(I,[a b c d]);%���òü������ü�ͼ�����У���a,b����ʾ�ü������Ͻ�������ԭͼ���е�λ�ã�c��ʾ�ü���ͼ��Ŀ�d��ʾ�ü���ͼ��ĸ�
for i=1:15
MM=imread(strcat('D:\ëϸ��ˮ\����\�����е�ͼƬ����\ͼƬ\CTͼ\h_t',num2str(i),'.bmp'));%��ȡ����
image=MM(:,:,:,1);%CTͼƬ���и��һ�����ص��3��������ͬ
crop_image = imcrop(image, [260, 50, 390, 560]); % ʹ�� imcrop() �������ü�ͼƬ���ڶ��������ĸ�ʽΪ [XMIN YMIN WIDTH HEIGHT]
imwrite(crop_image, strcat(strcat('D:\ëϸ��ˮ\����\�����е�ͼƬ����\ͼƬ\CTͼ\1\',num2str(i),'.bmp'))) % �����ļ�
imshow(crop_image);
end
