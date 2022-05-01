% ENCRYPTION
clear all;
close all;
img=imread('img/lena_std.tif');
img = rgb2gray(img);
en_img = img;

[r, c]=size(en_img);

step = 2; %3
size = 1; %2
for loop=1:16
    for i=1:step:r-size % 1:3:4 => i=1,4
        for j=1:step:c-size % 1:3:13 => j=1,4,7,10,13
            en_img(i:i+size,j:j+size) = rot90(en_img(i:i+size,j:j+size));
        end
    end
    step=step+4;
    size = size+4; %important to increase them with same value for both to be able to decrypt it
end

subplot(1,2,1), imshow(img);
subplot(1,2,2), imshow(en_img);
imwrite(en_img,'new.tif');

% % % DECRYPTION
% clear all;
% close all;
% img=imread('new.tif');
% % img = rgb2gray(img);
% % img = im2double(img);
% en_img = img;
% 
% [r, c]=size(en_img);
% 
% step = 62; %3
% size = 61; %2
% for loop=1:16
%     for i=1:step:r-size 
%         for j=1:step:c-size 
%             en_img(i:i+size,j:j+size) = rot90(rot90(rot90(en_img(i:i+size,j:j+size))));
%         end
%     end
%     step=step-4;
%     size = size-4;
% end
% 
% subplot(1,2,1), imshow(img);
% subplot(1,2,2), imshow(en_img);
