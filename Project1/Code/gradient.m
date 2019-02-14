graphics_toolkit('gnuplot') 

%[ A, y] = dlmread('linear-regression.train.csv', ",")

%[A, y] = textread( 'linear-regression.train.csv', '%s %s',',' )

%[A y] = csvimport('linear-regression.train.csv')

%A =  csvread('input.csv');


 data=dlmread('linear-regression.train.csv');
 A=data;
 y=A(:,2);
 A(:,2)=1;
w = [1;1]

alpha = 0.01;

maxiter = 100;

tol = 0.01;

m = size(A,1);

theta1 = w(1);

theta0 = w(2);


for i=1:maxiter 

	theta1 = theta1 - (1./(2*m))*alpha *sum( A*w - y );

	theta0 = theta0 - (1./(2*m))*alpha*sum((A * w - y).*A(:,1));

	w(1) = theta1;

	w(2) = theta0;
  
	w
	e = y - A*w;
  	%e
  	pause
	o(i) = sum(e.*e);
 
 
  if(i>1) && (abs(o(i)-o(i-1))<tol)
     break;
  end

endfor

plot(o);
w
%plot(data(:,1),data(:,2),'ro');
%hold on;
plot(data(:,1),A*w);







