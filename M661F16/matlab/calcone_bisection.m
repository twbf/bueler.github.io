% CALCONE_BISECTION  Find min of calculus I function by bisection search
% to solve f'(x) = 0.

%f = @(x) (x.^2 + cos(x)).^2 - 10.0 * sin(5.0 * x);
df = @(x) 2.0 * (x.^2 + cos(x)) .* (2.0 * x - sin(x)) ...
          - 50.0 * cos(5.0 * x);

% need to start with [a,b] which brackets single solution to f'(x)=0
a = 0.0;
b = 0.5;
if df(a) * df(b) > 0,  error('not bracket'),  end

% bisection search for f'(x)=0
while abs(b - a) > tol
    c = (a + b) / 2
    if df(c) * df(a) < 0
        b = c;
    else
        a = c;
    end
end
c = (a + b) / 2
