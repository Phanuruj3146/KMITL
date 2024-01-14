function ans_array = EulerMethodOneOrder(dy,starttime,endtime,init,stepsize)
ans_array = [ init ];
count = starttime;
index = 1;
while count ~= endtime
    ans_array(end+1) = ans_array(index) + ( dy(count,ans_array(index)).*stepsize );
    index = index + 1;
    count = count + stepsize;
end
plot(t,y(1,:))
plot(t,y(2,:))
plot(y(1,:),y(2,:))