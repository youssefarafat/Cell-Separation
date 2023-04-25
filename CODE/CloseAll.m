%%
h0 = figure
dapiIn = imread("RBD_LKR13_1_DAPI.tiff");
dapiIn(980:end,810:end,:)=0;
blue_channel            = dapiIn(:,:,3);
thresh_dapi = graythresh(blue_channel);
otsu_dapi = imbinarize(blue_channel,thresh_dapi);
se = strel('disk', 10);
close_dapi = imclose(otsu_dapi, se );
rr=200:800;
cc=200:800;
subplot(121)
imagesc(otsu_dapi(rr,cc,:))
subplot(122)
 imagesc( close_dapi(rr,cc))
 colormap gray
h0.Position = [ 100   400   900   300];

filename1='Dapi_Close.png';
print('-dpng','-r200',filename1)



%%
h1 =figure
phalloidinIn = imread("RBD_LKR13_1_Phalloidin.tif");
phalloidinIn(980:end,810:end,:)=0;
red_channelR = phalloidinIn(:,:,1);
thresh_phallo = graythresh(red_channelR);
otsu_phallo = imbinarize(red_channelR, thresh_phallo);
se = strel('disk', 10);
close_phallo = imclose(otsu_phallo,se);
rr=200:800;
cc=200:800;
subplot(121)
imagesc(otsu_phallo(rr,cc,:))
subplot(122)
 imagesc( close_phallo(rr,cc))
 colormap gray
h1.Position = [ 100   400   900   300];

filename2='Phalloidin_Close.png';
print('-dpng','-r200',filename2)

%%
h2 = figure
fibronectinIn = imread("RBD_LKR13_1_fibronectin.tif");
thresh_fibronectin = graythresh(fibronectinIn);
otsu_fibronectin = imbinarize(fibronectinIn, thresh_fibronectin);
se = strel('disk', 10);
close_fibro = imclose(otsu_fibronectin,se);
rr=200:800;
cc=200:800;
subplot(121)
imagesc(otsu_fibronectin(rr,cc,:))
subplot(122)
 imagesc( close_fibro(rr,cc))
 colormap gray
h2.Position = [ 100   400   900   300];

filename3='Fibronectin_Close.png';
print('-dpng','-r200',filename3)
