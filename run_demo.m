clc;clear;close all

I=imread('auntminnie-a-2020_01_28_23_51_6665_2020_01_28_Vietnam_coronavirus.jpeg');

I1=homathon(I);

figure(1)
imshowpair(I,I1,'montage')
title('Stage 1 : image Clearfication')

rmat=I1(:,:,1);
rlvl=.5;

Ix=im2bw(rmat,rlvl);

q=~Ix;
q=bwareaopen(q,750);

for k=1:size(I1,3)
    Iv(:,:,k)=immultiply(I1(:,:,k),q);
end

figure()
imshowpair(I1,Iv,'montage')
title('Stage 2 : Crop the lungs for CNN')