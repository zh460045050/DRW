function [ pb ] = calPbEdge( img )
%CALPBEDGE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

img = im2double(img);
pb = pbCGTG_nonmax(img); %superpixel segmentation-->probability img
[pb, ~] = max(pb, [], 3);

end

