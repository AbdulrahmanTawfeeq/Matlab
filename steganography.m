close all;
clear all;
clc;

% HIDING TEXT IN GRAY IMAGE
secret_msg = "HelloThereHowAreYouDoingHereIsThePassword";
delimiter = "???";
secret_msg = secret_msg + delimiter;
secret_bin = "";

bin_array = dec2bin(char(secret_msg),8);
[r, c] = size(bin_array);
for i=1:r
    for j=1:c
       secret_bin = secret_bin+bin_array(i,j);
    end
end

img = imread('img\lena_std.tif');
gray_img_o = rgb2gray(img);
gray_img = rgb2gray(img);
for i = 1:length(char(secret_bin)) 
    c = char(secret_bin);
    p = dec2bin(gray_img(end,i),8);
    p(end) = c(i);
    gray_img(end,i) = bin2dec(p) ;
end

subplot(1,2,1), imshow(gray_img_o);title("Original Image");
subplot(1,2,2), imshow(gray_img);title("Steganography");


% GETTING TEXT FROM GRAY IMAGE
message_gotten = "";
delimiter = "001111110011111100111111"; %???
check = "";
for i=1:8:length(gray_img(end,:))-8
    p = dec2bin(gray_img(end,i:i+7), 8);
    message_gotten = message_gotten+char(bin2dec(convertCharsToStrings(p(:,end))));
    if convertCharsToStrings(p(:,end)) == dec2bin('?',8)
        check = check+dec2bin('?',8);
    else
        check = "";
    end
    if check == delimiter
        message_gotten = char(message_gotten);
        message_gotten = message_gotten(1:end-3);
        break;
    end
end
message_gotten






    


