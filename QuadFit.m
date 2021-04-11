function a = QuadFit(x,y)
  
xs = size(x);
for i = 1 : xs
    Z = [x(i)^2, x(i), 1];
    if i == 1
        X = Z;
    else
        X = [X ; Z];
    end
end

TXX=transpose(X)*X;
TXY=transpose(X)*transpose(y);

T = [TXX, TXY];
[R, C] = size(T);
for j = 1 : R-1
  for i = j+1 : R
    T(i,j:C) = T(i,j:C)-T(i,j)/T(j,j)*T(j,j:C);
  end
end
a = zeros(R,1);
a(R) = T(R,C)/T(R,R);

for i = R - 1:-1:1
  a(i) = (T(i,C)-T(i,i+1:R)*a(i+1:R))/T(i,i);
end

