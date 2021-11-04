result = zeros(5,16);

for k = 1:5

    m = [1,2,5,10,20,50,100,200,500,1000,2000,5000,10000,20000,50000,100000];
    p = 1/4^k;

    for N = 1:16
        sum = 0;
        tic
        for L = 1:m(N)
            prod = 1;
            for n = L+1:m(N)
                prod = prod * (1-p^(n-1))^(m(N)-k*n+1);
            end
            sum = sum + L*(1-((1-p^(L-1))^(m(N)-k*L+1)))*prod;
            if(mod(100*L/m(N),1)==0)
                disp(100*L/m(N));
            end
        end
        toc
        disp(m(N));
        disp(sum);
        result(k,N) = sum;
    end
end

semilogx(m(1:16),result(1,1:16),'x-');
grid on
hold on
semilogx(m(1:16),result(2,1:16),'o-');
semilogx(m(1:16),result(3,1:16),':');
semilogx(m(1:16),result(4,1:16),'--');
semilogx(m(1:16),result(5,1:16),'-');
legend('k=1','k=2','k=3','k=4','k=5');
    