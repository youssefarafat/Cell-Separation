%%Skeleton map
%%
h0 = figure
dapiIn = imread("RBD_LKR13_1_DAPI.tiff");
dapiIn(980:end,810:end,:)=0;
blue_channel            = dapiIn(:,:,3);
thresh_dapi = graythresh(blue_channel);
otsu_dapi = imbinarize(blue_channel,thresh_dapi);
skel_dapi = bwskel(otsu_dapi);
rr=1:400;
cc=1:400;
subplot(121)
imagesc(otsu_dapi(rr,cc,:))
subplot(122)
 imagesc( skel_dapi(rr,cc))
 colormap gray
h0.Position = [ 100   400   900   300];

filename1='Dapi_SkeletonMap.png';
print('-dpng','-r200',filename1)
%%
h1 = figure
phalloidinIn = imread("RBD_LKR13_1_Phalloidin.tif");
phalloidinIn(980:end,810:end,:)=0;
red_channelR = phalloidinIn(:,:,1);
thresh_phallo = graythresh(red_channelR);
otsu_phallo = imbinarize(red_channelR, thresh_phallo);
skel_phallo = bwskel(otsu_phallo);

rr=1:400;
cc=1:400;
subplot(121)
imagesc(otsu_phallo(rr,cc,:))
subplot(122)
 imagesc( skel_phallo(rr,cc))
 colormap gray
h1.Position = [ 100   400   900   300];

filename2='Phalloidin_SkeletonMap.png';
print('-dpng','-r200',filename2)