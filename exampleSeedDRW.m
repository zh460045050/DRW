clear;
clc;
addpath(genpath(pwd));
img = imread('test_img2.jpg');

% w=fspecial('gaussian',[5 5], 1);
% img=imfilter(img,w);


[rows, cols, ~] = size(img);


%%%%%%%%%%%%%%%%%%%%%%%DRW%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%参数%%%%%
k = 2000;
beta = 1e-4; %自适应性参数
sigma = 50; %高斯距离参数
iter = 0; %迭代次数
type_seed = 'grid'; %节点选择方式--'grid', 'random', 'area', 'pb'
type_grad = 'pb'; %梯度信息选择--'area', 'pb'
isadapt = 1; %是否自适应
%%%%%%%%%%%%%%

%%%%%边界先验（可替代或不设置）%%%%%
%pb = zeros(rows, cols); %不使用边界先验
%pb = calGradient(img); %梯度作为边界先验
pb = calPbEdge(img); %pb边缘检测作为边界先验
%pb = calSobel(img); %Sobel边缘检测作为边界先验
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%执行算法%%%%%%%%%%%%
%%%SeedGenerate%%%
%[seed_x, seed_y] = mexCreateSeed(img, k, 'grid'); %网格初始化
%[seed_x, seed_y] = mexCreateSeed(img, k, 'random'); %随机初始化
%[seed_x, seed_y] = mexCreateSeed(img, k, 'area'); %三维初始化...面积
%[seed_x, seed_y] = mexCreateSeed(img, k, 'pb', pb); %三维初始化...边缘先验
[seed_x, seed_y] = waterSeed(pb); %分水岭初始化种子节点
%%%%%%%%%%%%%%%%%%

figure(5);imshow(img);
hold on
plot(seed_x, seed_y, 'b.', 'MarkerSize', 24);
hold off

%%%mexSeedDRW%%%%%
tic;
%[label_drw] = mexSeedDRW(img, seed_x, seed_y, beta, sigma, iter, pb, type_grad, isadapt);
%[label_drw] = mexSeedDRW(img, seed_x, seed_y, beta, sigma, iter);
[label_drw] = mexSeedDRW(img, seed_x, seed_y, beta, sigma, 0, pb, type_grad, 1);
%[label_drw] = mexSeedDRW(img, seed_x, seed_y);
toc;
sp_num = length(unique(label_drw))
%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%show%%%%%
result_drw = show_result(img, label_drw);
figure(2);imshow(result_drw);
%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


