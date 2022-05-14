clear;
clc;
img = imread('/Users/zhulei/DataSet/BloodLabel/6.jpg');
[rows, cols, ~] = size(img);

%img = imresize(img, [192, 192]);


%%%%%%%%%%%%%%%%%%%%%%%DRW%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%����%%%%%
k = 800;
beta = 1e-4; %����Ӧ�Բ���
sigma = 50; %��˹�������
iter = 0; %��������
type_seed = 'grid'; %�ڵ�ѡ��ʽ--'grid', 'random', 'area', 'pb'
type_grad = 'pb'; %�ݶ���Ϣѡ��--'area', 'pb'
isadapt = 1; %�Ƿ�����Ӧ
pb = zeros(rows, cols); %�ݶ���Ϣ
%%%%%%%%%%%%%%

%%%%%�߽����飨����������ã�%%%%%
%pb = zeros(rows, cols); %��ʹ�ñ߽�����
pb = calGradient(img); %�ݶ���Ϊ�߽�����
%pb = calPbEdge(img); %pb��Ե�����Ϊ�߽�����
%pb = calSobel(img); %Sobel��Ե�����Ϊ�߽�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%ִ���㷨%%%%%
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


