function ret = p2_27(n,m)
m=randi(10,n,m);
m(mod(m,2)~=0)=0;
ret = m;
end
