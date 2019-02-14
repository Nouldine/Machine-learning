# adding ; doesnt print it out
clear all
file_input = dlmread("hw2_data1.txt");
first_column = file_input(:,1)
second_column = file_input(:,2)
third_column = file_input(:,3)
last_column_with_one = [first_column, second_column ones(size(first_column,1), 1)]

w = [.01;0.01; 10]
alpha = .000001;#0.000001
maxiter =100;# 5000
tol = 0.01
m = 100
theta2 = w(1);
theta1 = w(2)
theta0 = w(3)

last_column_with_one;
for i=1: maxiter
   thetax = last_column_with_one*w;
   p= exp(-thetax);
   htheta=1./(1+p);
   
   theta1=theta1-alpha*sum((htheta-third_column).*last_column_with_one(:,2));
   theta0=theta0-alpha*sum(htheta-third_column);
   theta2=theta2-alpha*sum((htheta-third_column).*last_column_with_one(:,1));
   w(1) = theta2;
   w(2) = theta1;
   w(3) = theta0;
   
   thetax = last_column_with_one*w;
   p = exp(-thetax);
   htheta = 1./(1+p);
   
   o(i) = -(1./m)*(sum(third_column.*log(htheta) + (1-third_column).*log(1-htheta)));
  
endfor
w

o


plot(o)
figure,
#htheta
w
x= 30:100;
y = (-w(2)*x - w(3))./w(1);
zeroclass=find(third_column==0);
oneclass=find(third_column==1);

plot(first_column(zeroclass),second_column(zeroclass), 'r*');
hold on;
plot(first_column(oneclass),second_column(oneclass), 'b*');
hold on;
plot(x,y);