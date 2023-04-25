function dataOut2 = PhalloidinRBD(dataIn1)
dataIn1 = imread("RBD_LKR13_1_Phalloidin.tiff");
[rows,cols,channels] = size(dataIn1);
dataIn1(980:end,810:end,:)=0;
red_channelR = dataIn1(:,:,1);
red_channelR_filt       = imfilter(red_channelR,fspecial('Gaussian',5));
red_channelR_thres      = red_channelR_filt>120;
red_channelR_labelled   = bwlabel(red_channelR_thres);
red_channelR_filled     = imfill(red_channelR_labelled);
red_channelR_clean = bwareaopen(red_channelR_filled, 150);
red_channelR_closed = imclose(red_channelR_clean, strel('disk',35));
red_channelR_dilate = imdilate(red_channelR_closed, strel('disk', 15));
%imagesc(red_channelR_clean + red_channelR_dilate);
%splitR = (bwdist(red_channelR_clean + red_channelR_dilate)>40);
%imagesc(splitR)
 red_channelR_distance =(bwdist(1-red_channelR_dilate));
 colormap jet ;
 %%
 red_channelR_skel = bwmorph(bwskel(red_channelR_dilate),'spur',90);

 %%
 %imagesc(red_channelR_skel .* red_channelR_distance);
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
 %imagesc(labeled_filt_islands);
 filt_island_props = regionprops(labeled_filt_islands,'Area');
islands_orientation_props = regionprops(labeled_filt_islands,'Orientation');
islands_orientation_specific = ([islands_orientation_props.Orientation]);
islands_orientation = mean(islands_orientation_specific);
std_islands_orientation = std(islands_orientation);
 n_islands = max(labeled_filt_islands(:));
 for k =1:n_islands
   total_area(k)= ([filt_island_props(k).Area]);
   ftotal_area = sum(total_area);
 end
 area_results = total_area(:);
 %rcarea_results = ftotal_area/rows/cols;
 mean_area_islands = ftotal_area/n_islands;
dataOut2.total_area = total_area; 
dataOut2.area_results  = area_results; 
dataOut2.ftotal_area = ftotal_area;
dataOut2.mean_area_islands = mean_area_islands; 
dataOut2.n_islands = n_islands;
dataOut2.red_channelR_distance = red_channelR_distance; 
dataOut2.red_channelR_skel = red_channelR_skel;
dataOut2.red_channelR_split = red_channelR_split;
dataOut2.edgeprops = edgeprops;
dataOut2.islands = islands;
dataOut2.labeled_filt_islands = labeled_filt_islands;
dataOut2.islands_orientation = islands_orientation;
dataOut2.std_islands_orientation = std_islands_orientation;
end
 %% Repeat same operation for the WT, Turn commands into a function, find
 %  breaking points, dilate then remove. find a line that is perpendicular.
 %red_channelR_split = red_channelR_dilate - red_channelR_dilatesplit;
%imagesc(red_channelR_split)
%imagesc(1-red_channelR_split)
