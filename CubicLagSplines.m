function Yint = CubicLagSplines(x,y,xint)

n = length(x);
if (xint >= x(1) && xint <= x(2))
    X = [x(1) x(2) x(3)];
    Y = [y(1) y(2) y(3)];
    p = polyfit(X,Y,2);
    Yint = p(1)*xint.^2 + p(2)*xint + p(3);
elseif(xint >= x(n-1) && xint <= x(n))
    X = [x(n-2) x(n-1) x(n)];
    Y = [y(n-2) y(n-1) y(n)];
    p = polyfit(X,Y,2);
    Yint = p(1)*xint.^2 + p(2)*xint + p(3);
else
    for i = 2 : n-1
        if(xint >= x(i) && xint <= x(i+1))
            X = [x(i-1) x(i) x(i+1) x(i+2)];
            Y = [y(i-1) y(i) y(i+1) y(i+2)];
            p = polyfit(X,Y,3);
            Yint = p(1)*xint.^3 + p(2)*xint.^2 + p(3)*xint + p(4);
            break
        end
    end
end
