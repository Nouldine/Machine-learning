graphics_toolkit('gnuplot'); 


A = [ 3 1; 2 1; 4 1; 0 1 ]


y = [ 4; 1; 3; 1 ]


aa = A' * A

iaa = aa^-1

w = iaa * A' * y

e = ( y - A*w )

Err = sum(e.*e)

plot(A(:,1),y,'ro');

hold on;

plot(A(:,1),A*w)


