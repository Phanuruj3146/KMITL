function ans_array = EulerMethod(dy,starttime,endtime,init,stepsize)

t = starttime : stepsize : endtime ;
ans_array(1) = init ;

for i = 1 : length(t) - 1
  ans_array(i+1) = ans_array(i) + ( dy(t(i), ans_array(i)) .* stepsize);
end
