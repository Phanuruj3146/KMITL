function ret = p2_26(n)
m=randi(10,n,n);
m(mod(m,2)==0)=0;
ret = m;
end
