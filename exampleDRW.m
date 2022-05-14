clear;
clc;
img = imread('/Users/zhulei/DataSet/BloodLabel/6.jpg');
[rows, cols, ~] = size(img);

%img = imresize(img, [192, 192]);


%%%%%%%%%%%%%%%%%%%%%%%DRW%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%参数%%%%%
k = 800;
beta = 1e-4; %自适应性参数
sigma = 50; %高斯距离参数
iter = 0; %迭代次数
type_seed = 'grid'; %节点选择方式--'grid', 'random', 'area', 'pb'
type_grad = 'pb'; %梯度信息选择--'area', 'pb'
isadapt = 1; %是否自适应
pb = zeros(rows, cols); %梯度信息
%%%%%%%%%%%%%%

%%%%%边界先验（可替代或不设置）%%%%%
%pb = zeros(rows, cols); %不使用边界先验
pb = calGradient(img); %梯度作为边界先验
%pb = calPbEdge(img); %pb边缘检测作为边界先验
%pb = calSobel(img); %Sobel边缘检测作为边界先验
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%执行算法%%%%%
%%%mexDRW%%%
%[label_drw, seed_x, seed_y] = mexDRW(img, k, beta, sigma, iter, pb, type_seed, type_grad, isadapt);
%[label_drw, seed_x, seed_y] = mexDRW(img, k, beta, sigma, iter);
[label_drw, seed_x, seed_y] = mexDRW(img, k, beta, sigma);
%[label_drw, seed_x, seed_y] = mexDRW(img, k);
%%%%%%%%%%%%

%%%mexSeedDRW%%%
%[label_drw] = mexSeedDRW(img, seed_x, seed_y, beta, sigma, iter, pb, type_grad, isadapt);
%[label_drw] = mexSeedDRW(img, seed_x, seed_y, beta, sigma, iter);
%[label_drw] = mexSeedDRW(img, seed_x, seed_y, beta, sigma);
%[label_drw] = mexSeedDRW(img, seed_x, seed_y);
%%%%%%%%%%%%%%%%

sp_num = length(unique(label_drw))
%%%%%%%%%%%%%%%%%%

%%%%%show%%%%%
result_drw = show_result(img, label_drw);
figure(2);imshow(result_drw);
%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


