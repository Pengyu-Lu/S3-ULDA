function [train_scale,test_scale,ps] = scaleForSVM(train_data,test_data,ymin,ymax)
% scaleForSVM 
%
% by faruto
% Email:patrick.lee@foxmail.com QQ:516667408 http://blog.sina.com.cn/faruto
% last modified 2011.06.08
%
% ��ת����ע����
% faruto and liyang , LIBSVM-farutoUltimateVersion 
% a toolbox with implements for support vector machines based on libsvm, 2011. 
% Software available at http://www.matlabsky.com
% 
% Chih-Chung Chang and Chih-Jen Lin, LIBSVM : a library for
% support vector machines, 2001. Software available at
% http://www.csie.ntu.edu.tw/~cjlin/libsvm
%%

%nargin��������ĸ���
if nargin < 3
    ymin = 0;
    ymax = 1;
end
if nargin < 2
    test_data = train_data;
end
%%
[mtrain,ntrain] = size(train_data);
%disp(mtrain);
%fprintf('\n');
%disp(ntrain);
%fprintf('\n');
[mtest,ntest] = size(test_data);
%disp(mtest);
fprintf('\n');
%disp(ntest);
dataset = [train_data;test_data];

[dataset_scale,ps] = mapminmax(dataset',ymin,ymax);
%��һ��
%1����һ����ӿ����ݶ��½������Ž���ٶȣ�
%2����һ���п�����߾��ȣ���KNN��
dataset_scale = dataset_scale';
%ת��
train_scale = dataset_scale(1:mtrain,:);
test_scale = dataset_scale( (mtrain+1):(mtrain+mtest),: );
