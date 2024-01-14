function ret = p2_18(n)
if mod(n,2)==0
    n = n+1;
elseif mod(n,2)==1
    n = n-1;
end
ret = n;
end
    