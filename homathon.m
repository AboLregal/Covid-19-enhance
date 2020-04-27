function I1=homathon(I)
%% Getting Image

% I=imread('auntminnie-a-2020_01_28_23_51_6665_2020_01_28_Vietnam_coronavirus.jpeg');

[row,col,n]=size(I);

for i=1:n
    Ix=I(:,:,i);
    %% Weiner Filter
    
    % We will create average mask [3 3]
    % with SNR = 0.2
    mask=fspecial('average',[3 3]);
    SNR=0.2;
    Ix=deconvwnr(Ix,mask,SNR);
    % figure(6)
    % imshow(I)
    % title('Weiner Filter')
    
    %% Clahe Filter
    
    I1(:,:,i)=adapthisteq(Ix);
    % figure(7)
    % imshow(I1)
    % title('Clahe Filter')
end
