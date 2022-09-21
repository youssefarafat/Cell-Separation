img5 = imread("RBD_LKR13_1_Fibronectin.tif");
imagesc(img5);
fibronectinprops = regionprops(img5, 'Area');
fibro_blue = img5(:,:,3)

