function [ seed_x, seed_y ] = waterSeed( pb )
%CREATEWATERSHEDSEED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

pb(pb<0.1) = 0;
L = watershed(pb); 
wr = L == 0;
aa = 1 - wr;
[labeled,~] = bwlabel(aa, 8);
STATS = regionprops(labeled,'centroid');
centroids = cat(1, STATS.Centroid);

seed_x = round(centroids(:,1));
seed_y = round(centroids(:,2));

end

