function ret = p2_22(n1,n2,n3)
sorted = sort([n1,n2,n3]);
ret = sorted(end) - sorted(1);
end