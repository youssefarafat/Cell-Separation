%%Distance Transfrom
%%
h0 = figure
dapiIn = imread("RBD_LKR13_1_DAPI.tiff");
dapiIn(980:end,810:end,:)=0;
blue_channel            = dapiIn(:,:,3);
thresh_dapi = graythresh(blue_channel);
otsu_dapi = imbinarize(blue_channel,thresh_dapi);

dist_dapi = bwdist(otsu_dapi,'euclidean');
rr=1:400;
cc=1:400;
subplot(121)
imagesc(otsu_dapi(rr,cc,:))
subplot(122)
 imagesc( dist_dapi(rr,cc))
 colormap jet
h0.Position = [ 100   400   900   300];

filename1='Dapi_DistanceTransform.png';
print('-dpng','-r200',filename1)

%%
h1 = figure
phalloidinIn = imread("RBD_LKR13_1_Phalloidin.tif");
phalloidinIn(980:end,810:end,:)=0;
red_channelR = phalloidinIn(:,:,1);
thresh_phallo = graythresh(red_channelR);
otsu_phallo = imbinarize(red_channelR, thresh_phallo);
dist_phallo = bwdist(otsu_phallo,'euclidean');
rr=1:400;
cc=1:400;
subplot(121)
imagesc(otsu_phallo(rr,cc,:))
subplot(122)
 imagesc( dist_phallo(rr,cc))
 colormap jet
h1.Position = [ 100   400   900   300];

filename2='Phalloidin_DistanceTransform.png';
print('-dpng','-r200',filename2)
%%
h2 = figure
fibronectinIn = imread("RBD_LKR13_1_fibronectin.tif");
thresh_fibronectin = graythresh(fibronectinIn);
otsu_fibronectin = imbinarize(fibronectinIn, thresh_fibronectin);
dist_fibro = bwdist(otsu_fibronectin,'euclidean');
rr=1:400;
cc=1:400;
subplot(121)
imagesc(otsu_fibronectin(rr,cc,:))
subplot(122)
 imagesc( dist_fibro(rr,cc))
 colormap jet
h2.Position = [ 100   400   900   300];

filename3='Fibronectin_DistanceTransform.png';
print('-dpng','-r200',filename3)
