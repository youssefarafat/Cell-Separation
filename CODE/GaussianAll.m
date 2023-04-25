clear all
close all
%%
h0 = figure
dapiIn = imread("RBD_LKR13_1_DAPI.tiff");
dapiIn(980:end,810:end,:)=0;
blue_channel            = dapiIn(:,:,3);
Gauss_dapi = imfilter(blue_channel, fspecial('gaussian',3));
Gauss_dapi2 = imfilter(blue_channel, fspecial('gaussian',30));
%imshowpair(dapiIn, Gauss_dapi, 'montage')
rr=200;cc=200;
subplot(131)
imagesc(blue_channel(1:rr,1:cc)) 
subplot(132)
imagesc( Gauss_dapi(1:rr,1:cc)) 
subplot(133)
imagesc(Gauss_dapi2(1:rr,1:cc) )
colormap gray
h0.Position = [ 100   400   900   300];

filename1='Dapi_Gaussian.png';
print('-dpng','-r200',filename1)

%%

h1 = figure
phalloidinIn = imread("RBD_LKR13_1_Phalloidin.tif");
phalloidinIn(980:end,810:end,:)=0;
red_channelR = phalloidinIn(:,:,1);
Gauss_phallo = imfilter(red_channelR, fspecial('gaussian',3));
Gauss_phallo1 = imfilter(red_channelR, fspecial('gaussian',30));
%imshowpair(dapiIn, Gauss_dapi, 'montage')
rr=200;cc=200;
subplot(131)
imagesc(red_channelR(1:rr,1:cc)) 
subplot(132)
imagesc( Gauss_phallo(1:rr,1:cc)) 
subplot(133)
imagesc(Gauss_phallo1(1:rr,1:cc) )
colormap gray
h1.Position = [ 100   400   900   300];

filename2='Phalloidin_Gaussian.png';
print('-dpng','-r200',filename2)
%%
h2 = figure
fibronectinIn = imread("RBD_LKR13_1_fibronectin.tif");
Gauss_fibro = imfilter(fibronectinIn, fspecial('gaussian',3));
Gauss_fibro1 = imfilter(fibronectinIn, fspecial('gaussian',30));
rr=200;cc=200;
subplot(131)
imagesc(fibronectinIn(1:rr,1:cc)) 
subplot(132)
imagesc( Gauss_fibro(1:rr,1:cc)) 
subplot(133)
imagesc(Gauss_fibro1(1:rr,1:cc) )
colormap gray
h2.Position = [ 100   400   900   300];

filename3='Fibronectin_Gaussian.png';
print('-dpng','-r200',filename3)