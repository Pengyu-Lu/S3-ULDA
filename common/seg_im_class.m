function Results = seg_im_class(Y,Ln)
    [M,N,B]=size(Y);
    Y_reshape=reshape(Y,M*N,B);
    Gt=reshape(Ln,[1,M*N]);
    Class=unique(Gt);
    %disp(size(Class));Ҳ����0~74�����ص��Ǻ�labels��һ����ֵ������û���ظ�Ԫ�ء������Ľ����������������
    Num=size(Class,2);
    %disp(Num);
    Y=cell(1,Num);
    %disp(Y); ����һ��cell  һ��75��
    index=cell(1,Num);
    
    for i=1:Num
        Results.index{1,i}=find(Gt==Class(i));
        nowlabels=Results.index{1,i};
        Results.nowlabel{1,i}=Gt(nowlabels(1));
        %disp(Results.index{1,i});
        %�ҵ�0~74�����ؿ����ڵ�[m] [n]
        [m,n] = find(Ln==Class(i));
        %disp([m,n]);
        Results.cor{1,i} = [m,n];
        Results.Y{1,i} =Y_reshape(find(Gt==Class(i)),:);
        %disp(Results.Y{1,i});
    end
    
end
