function [ sobel ] = calSobel( img )
%CALSOBEL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
img = im2double(img);
w_h=[1,2,1;0,0,0;-1,-2,-1];              
img_h=imfilter(img,w_h,'replicate');       
w_w=[-1,0,1;-2,0,2;-1,0,1];             
img_w=imfilter(img,w_w,'replicate');       
img_grad=sqrt(img_w.^2+img_h.^2);           
grad_max=max(max(img_grad));
img_grad=img_grad ./ grad_max;
[sobel, ~] = max(img_grad, [], 3);
end

