
graphics_toolkit('gnuplot');

data = dlmread('hw2_data1.txt');

A=data;
y=A(:,3);
A(:,3)=1;

w = [0;0;0]

alpha = 0.001
maxiter = 5000

w = [0;0;0]

tol = 0.01
m = 100
theta2 = w(1)
theta1 = w(2)
theta0 = w(3)


for i=1:maxiter

	thetax = A*w
	p = exp(-thetax)
	htheta = 1./(1+p)

	theta2 = theta2-(1./(m))*alpha*sum((htheta-y).*A(:,1))
	theta0 = theta1-(1./(m))*alpha*sum(htheta-y)
	theta1 = theta0-(1./(m))*alpha*sum((htheta-y).*A(:,2))

	w(1) = theta2
	w(2) = theta1
	w(3) = theta0

	thetax = A*w
	p = exp(-thetax)
	htheta = 1./(1+p)

	o(i)=-1*sum(y.*log(htheta)+(1-y).*log(1-htheta))

endfor

plot(o)

x =A(:,1)

Y=(-theta2/theta1)*x-(theta0/theta1);
zerocolum=find(y==0);
onecolumn=find(y==1);

first_column=A(:,1);
second_column=A(:,2);

#plot(first_column(zerocolum),second_column(onecolumn), 'r*');
#hold on;
#plot(first_column(onecolumn),second_column(onecolumn), 'b*');

plot(x,y







