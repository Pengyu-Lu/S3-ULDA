function [ Sb ] = getsb( data,num_labels )
%GETS ���ĸ���֮
%   �õ�Sw
   pixel_num=0;
   [NN,~]=size(data{1,1}');
   %2*3
   u=zeros(NN,1);
   for i=1:num_labels
       one_set=data{1,i};
       [onelabel_num,NN]=size(one_set);
       %3*2
       %NN��ά��,onelabel_num�Ǹñ�ǩ�����ص����
       onelabel=sum(one_set,1);
       onelabel=reshape(onelabel,NN,1);
       u=u+onelabel;
       pixel_num=pixel_num+onelabel_num;
   end
   %���Ǿ���Ϊʲô����λС���أ����̽��һ��
   %disp(Sw);
   u=u/pixel_num;
   %disp(Sw);
   Sb=zeros(NN,NN);
   for i=1:num_labels
       one_set=data{1,i};
       %3*2
       [onelabel_num,NN]=size(one_set);
       onelabel=sum(one_set,1);
       onelabel=reshape(onelabel,NN,1);
       Ui=onelabel/onelabel_num;
       onerect=Ui-u;
       Sb=Sb+(onerect*onerect')*onelabel_num;
   end
end