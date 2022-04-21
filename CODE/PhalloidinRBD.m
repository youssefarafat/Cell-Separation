img4 = imread("RBD_LKR13_1_Phalloidin.tif");
red_channelR = img4(:,:,1);
red_channelR_filt       = imfilter(red_channelR,fspecial('Gaussian',5));
red_channelR_thres      = red_channelR_filt>120;
red_channelR_labelled   = bwlabel(red_channelR_thres);
red_channelR_filled     = imfill(red_channelR_labelled);
red_channelR_clean = bwareaopen(red_channelR_filled, 150);
red_channelR_closed = imclose(red_channelR_clean, strel('disk',30));
red_channelR_dilate = imdilate(red_channelR_closed, strel('disk', 10));
imagesc(red_channelR_clean + red_channelR_dilate)