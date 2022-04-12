img2 = imread("WT_LKR13_1_Phalloidin.tif");
red_channel = img2(:,:,1);
red_channel_filt       = imfilter(red_channel,fspecial('Gaussian',5));
red_channel_thres      = red_channel_filt>120;
red_channel_labelled   = bwlabel(red_channel_thres);
