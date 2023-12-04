x = -10:1:10;
g = plot(x,2.^x);
xlabel('x');
ylabel('y');
title('x vs y');
g.LineStyle = "--";
g.Color = "r";
g.Marker = "x";
g.MarkerSize = 15;
g.MarkerEdgeColor = 'g';
g.MarkerFaceColor = 'g';