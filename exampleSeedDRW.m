clear;
clc;
addpath(genpath(pwd));
img = imread('test_img2.jpg');

% w=fspecial('gaussian',[5 5], 1);
% img=imfilter(img,w);


[rows, cols, ~] = size(img);


%%%%%%%%%%%%%%%%%%%%%%%DRW%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%����%%%%%
k = 2000;
beta = 1e-4; %����Ӧ�Բ���
sigma = 50; %��˹�������
iter = 0; %��������
type_seed = 'grid'; %�ڵ�ѡ��ʽ--'grid', 'random', 'area', 'pb'
type_grad = 'pb'; %�ݶ���Ϣѡ��--'area', 'pb'
isadapt = 1; %�Ƿ�����Ӧ
%%%%%%%%%%%%%%

%%%%%�߽����飨����������ã�%%%%%
%pb = zeros(rows, cols); %��ʹ�ñ߽�����
%pb = calGradient(img); %�ݶ���Ϊ�߽�����
pb = calPbEdge(img); %pb��Ե�����Ϊ�߽�����
%pb = calSobel(img); %Sobel��Ե�����Ϊ�߽�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%ִ���㷨%%%%%%%%%%%%
%%%SeedGenerate%%%
%[seed_x, seed_y] = mexCreateSeed(img, k, 'grid'); %�����ʼ��
%[seed_x, seed_y] = mexCreateSeed(img, k, 'random'); %�����ʼ��
%[seed_x, seed_y] = mexCreateSeed(img, k, 'area'); %��ά��ʼ��...���
%[seed_x, seed_y] = mexCreateSeed(img, k, 'pb', pb); %��ά��ʼ��...��Ե����
[seed_x, seed_y] = waterSeed(pb); %��ˮ���ʼ�����ӽڵ�
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


