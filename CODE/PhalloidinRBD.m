function dataOut = PhalloidinRBD(dataIn1)
dataIn1 = imread("RBD_LKR13_1_Phalloidin.tiff");
dataIn1(980:end,810:end,:)=0;
red_channelR = dataIn1(:,:,1);
red_channelR_filt       = imfilter(red_channelR,fspecial('Gaussian',5));
red_channelR_thres      = red_channelR_filt>120;
red_channelR_labelled   = bwlabel(red_channelR_thres);
red_channelR_filled     = imfill(red_channelR_labelled);
red_channelR_clean = bwareaopen(red_channelR_filled, 150);
red_channelR_closed = imclose(red_channelR_clean, strel('disk',35));
red_channelR_dilate = imdilate(red_channelR_closed, strel('disk', 15));
imagesc(red_channelR_clean + red_channelR_dilate);
%splitR = (bwdist(red_channelR_clean + red_channelR_dilate)>40);
%imagesc(splitR)
 red_channelR_distance =(bwdist(1-red_channelR_dilate));
 colormap jet ;
 %%
 red_channelR_skel = bwmorph(bwskel(red_channelR_dilate),'spur',90);

 %%
 imagesc(red_channelR_skel .* red_channelR_distance);
 step1 = (red_channelR_skel .* red_channelR_distance) > 0;
 step2 = (red_channelR_skel .* red_channelR_distance) <30;
 step3 = (step1 .* step2);
 step4 = red_channelR_dilate + step3;
 %red_channelR_dilatesplit = ((red_channelR_skel .* red_channelR_distance)>0).*((red_channelR_skel .* red_channelR_distance)<30);
 red_channelR_dilatesplit = imdilate(step3, strel('disk',25));
 red_channelR_split = red_channelR_dilate - red_channelR_dilatesplit;
 edgedetect = edge(red_channelR_clean,'canny');
 edgeprops = regionprops(edgedetect, 'Circularity','Orientation','Area');
 edge_filtered           = ismember(edgedetect,find([edgeprops.Area]<100));
 islands = (bwlabel(red_channelR_dilate .* (1 - red_channelR_dilatesplit)));
 %islands with an Area less than 12000 do not contain any cells
 all_island_properties = regionprops(islands,'Area');
 filtered_islands = ismember(islands,find([all_island_properties.Area]> 12000));
 labeled_filt_islands = bwlabel(filtered_islands);
dataOut.red_channelR_distance = red_channelR_distance; 
dataOut.red_channelR_skel = red_channelR_skel;
dataOut.red_channelR_split = red_channelR_split;
dataOut.edgeprops = edgeprops;
dataOut.islands = islands;
dataOut.labeled_filt_islands = labeled_filt_islands;
end
 %% Repeat same operation for the WT, Turn commands into a function, find
 %  breaking points, dilate then remove. find a line that is perpendicular.
 %red_channelR_split = red_channelR_dilate - red_channelR_dilatesplit;
%imagesc(red_channelR_split)
%imagesc(1-red_channelR_split)
