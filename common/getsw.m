% function [ Sw ] = getsw( data,num_labels )
% %GETS ���ĸ���֮
% %   �õ�Sw
%    pixel_num=0;
%    [NN,~]=size(data{1,1}');
%    u=zeros(NN,1);
%    Sw=zeros(NN,NN);
%    for i=1:num_labels
%        one_set=data{1,i}';
%        [NN,onelabel_num]=size(one_set);
%        %NN��ά��,onelabel_num�Ǹñ�ǩ�����ص����
%        onelabel=sum(one_set,2);
%        Ui=onelabel/onelabel_num;
%        for o=1:onelabel_num
%            onerect=one_set(:,o)-Ui;
%            Sw=Sw+onerect*onerect';
%        end
%    end
%    %disp(Sw);
% end
% 
% 

function [ Sw ] = getsw( data,num_labels )
%GETS ���ĸ���֮
%   �õ�Sw
   pixel_num=0;
   [NN,~]=size(data{1,1}');
   %2*3
   u=zeros(NN,1);
   Sw=zeros(NN,NN);
   for i=1:num_labels
       one_set=data{1,i};
       [onelabel_num,NN]=size(one_set);
       %NN��ά��,onelabel_num�Ǹñ�ǩ�����ص����
       onelabel=sum(one_set,1);
       onelabel=reshape(onelabel,NN,1);
       Ui=onelabel/onelabel_num;
       for o=1:onelabel_num
           onerect=one_set(o,:)'-Ui;
           Sw=Sw+onerect*onerect';
       end
   end
   %disp(Sw);
end



