function ret = p2_21(n1,n2,n3)
sorted = sort([n1,n2,n3]);
ret = sorted(end) + sorted(end-1);
end