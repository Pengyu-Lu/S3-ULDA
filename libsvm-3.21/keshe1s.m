function answer = keshe1()
    x1 = input('x1=');%��ʼ���������x
    x2 = input('x2=');%��ʼ���������x
    eps = input('eps=');%������Ҫ���ľ���
    delta=1e-10;
    N=100;%������������
    k=0;
    tic
    while(1)
        x2=x1-func2_2(x1)*(x1-x0)/(func2_2(x1)-func2_2(x0));
        k=k+1
        if(k>N||abs(x2)<eps)
            disp('Newton method failed')
            break
        end
        if abs(x2)<1
            d=x2-x1;
        else
            d=(x2-x1)/x2;
        end
        x0=x1;
        x1=x2
        y1=func2_2(x1)
        if(abs(d)<eps||abs(func2_2(x2))<delta)
            break
        end
end
toc
function y=func2_2(x)%����
    y=x*x-5;
end

