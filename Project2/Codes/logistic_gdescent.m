graphics_toolkit('gnuplot');

A = [ 2 1 1; 1 20 1; 1 5 1; 4 1 1; 1 40 1; 3 30 1 ]

y = [0; 0; 0; 1; 1; 1]

G1 = [2 1 ; 1 20 ; 1 5 ]
G2 = [ 4 1 ; 1 40 ; 3 30 ]

w = [0;0;0]

alpha = 0.01
maxiter = 5000

tol = 0.01
m = 6
theta2 = w(1)
theta1 = w(2)

theta0 = w(3)


for i=1:maxiter
  
   thetax = A*w
   p = exp(-thetax)
   htheta = 1./(1+p)

   theta2 = theta2-(1./(m))*alpha*sum((htheta-y).*A(:,1))
   theta0 = theta1-(1./(m))*alpha*sum(htheta-y )
   theta1 = theta0-(1./(m))*alpha*sum((htheta-y).*A(:,2))
   
   w(1)= theta2
   w(2) = theta1
   w(3)= theta0

   thetax = A*w;
   p = exp(-thetax)
   htheta = 1./(1+p)
   
	 o(i)=-1*sum(y.*log2(htheta)+(1-y).*log2(1-htheta))
   
endfor
 
plot(o)

htheta

x= [0:4];
y = (-theta2/theta1)*x-(theta0/theta1);
plot(G1(:,1),G1(:,2), 'r*', G2(:,1), G2(:,2), 'bx', x, y, 'g')





