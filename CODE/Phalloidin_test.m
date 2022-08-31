img2 = imread("WT_LKR13_1_Phalloidin.tif");
red_channel = img2(:,:,1);
red_channel_filt       = imfilter(red_channel,fspecial('Gaussian',5));
red_channel_thres      = red_channel_filt>120;
red_channel_labelled   = bwlabel(red_channel_thres);
img3 = imread("RBD_LKR13_1_Phalloidin.tif");
red_channel_filled     = imfill(red_channel_labelled);
red_channel_clean = bwareaopen(red_channel_filled, 150);
red_channel_closed = imclose(red_channel_clean, strel('disk',30));
red_channel_dilate = imdilate(red_channel_closed, strel('disk', 10));
imagesc(red_channel_clean + red_channel_dilate)
red_channel_distance =(bwdist(1-red_channel_dilate));
 colormap jet ;
 red_channel_skel = (bwskel(red_channel_dilate));
 imagesc(red_channel_skel .* red_channel_distance)
