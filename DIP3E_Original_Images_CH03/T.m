function [s] = T(r,MN,L, pdf)
s = 0;
for i=0:r
    s = s + pdf(i+1);
end
s = round(s .* (L-1) ./ MN );
end