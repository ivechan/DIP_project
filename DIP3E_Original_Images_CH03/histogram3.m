
image_path = 'Fig0320(2)(2nd_from_top).tif';
im = imread(image_path);
[h,w] = size(im);
L=256
% calc pdf
pdf = zeros(L,1);
for i=1:h;
    for j=1:w;
        pdf(im(i,j)+1,1) = pdf(im(i,j)+1,1)+1;
    end
end
% calc cdf
cdf_norm = round(cumsum(pdf)/( h .* w) .* (L-1));

im_processed = zeros('like', im)


for i=1:h;
    for j=1:w;
        im_processed(i,j) = cdf_norm(im(i,j) +1 );
        %im(i,j) = T(im(i,j), h .* w, L, pdf);
    end
end
%figure(1);
%histogram(im)
figure('Name','my code','NumberTitle','off')
histogram(im_processed);
figure('Name','matlab ver.','NumberTitle','off');
im_matlab = histeq(im, 256);
histogram(im_matlab);
