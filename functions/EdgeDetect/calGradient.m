function [ grad ] = calGradient( img )
%CALGRADIENT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
g_img=rgb2gray(img); 
A=double(g_img);
[GX,GY]=gradient(A);
G=sqrt(GX.*GX+GY.*GY);
grad = G / 255.0;
end

