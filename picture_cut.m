% imcrop(I,[a b c d]);%利用裁剪函数裁剪图像，其中，（a,b）表示裁剪后左上角像素在原图像中的位置；c表示裁剪后图像的宽，d表示裁剪后图像的高
for i=1:15
MM=imread(strcat('D:\毛细吸水\程序\论文中的图片程序\图片\CT图\h_t',num2str(i),'.bmp'));%读取数据
image=MM(:,:,:,1);%CT图片被切割后一个像素点的3个数都相同
crop_image = imcrop(image, [260, 50, 390, 560]); % 使用 imcrop() 函数来裁剪图片，第二个参数的格式为 [XMIN YMIN WIDTH HEIGHT]
imwrite(crop_image, strcat(strcat('D:\毛细吸水\程序\论文中的图片程序\图片\CT图\1\',num2str(i),'.bmp'))) % 保存文件
imshow(crop_image);
end
