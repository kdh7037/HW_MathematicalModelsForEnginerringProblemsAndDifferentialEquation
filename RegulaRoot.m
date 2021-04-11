function Xs=RegulaRoot(Fun,a,b,ErrMax);
imax = 100;
Fa = Fun(a); Fb = Fun(b);
if Fa*Fb > 0
    disp('Error: The function has the same sign at points a and b.')
else
    for i = 1:imax
        xNS = ((a*Fb-b*Fa)/(Fb-Fa));
        FxNS = Fun(xNS);
        if FxNS == 0
            fprintf('An exact solution x=%11.6f was found', xNS)
            break
        end
        if i == imax
            fprintf('Solution was not obtained in %i iterations', imax)
            break
        end
        if Fa*FxNS < 0
            b = xNS;
            Fb = FxNS
        else
            a = xNS;
            Fa = FxNS;
        end
    end
end