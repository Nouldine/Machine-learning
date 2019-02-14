
function kmeans

	pkg load statistics;

	X = dlmread("mnist_train.csv");

	labels = X(:,1);

	X(:,1) = [];

	%K = 10;
	
	N = 100;

	plotting  = []

	%class = Mainfunction( X, K, N );

	%K = [ 5, 10, 20, 25 ]
	
	%for i=K	

		%plotting = [ plotting, Mainfunction( X, K,  N ) ]

	%end

	k1 = 5
	k2 = 10
	k3 = 15
	k4 = 20
	k5 = 25

	plotting1 = [];
	plotting2 = [];
	plotting3 = [];
	plotting4 = [];


	%for i=1:k1
	
	%	plotting1 = [ plotting1, Mainfunction( X, k1, N ) ]

	%endfor	


	class = Mainfunction( X, k5, N )


	plotting = []


	%for i:1:k1

	
	%plotting2 = [ plotting2, Mainfunction( X, k2, N ) ] 

	%plotting3 = [ plotting3, Mainfunction( X, k3, N ) ]

	%plotting4 = [ plotting4, Mainfunction( X, k4, N ) ]

	
	%plot(1:5, plotting1 )

	%hold on;

	%plot( plotting2 )

	%hold on;

	%plot( plotting3 )

	%hold on;

	%plot( plotting4 )


endfunction

function  class = Mainfunction( X, K, N )
	 
	for  i1=1:N 

		p = randperm(size(X,1));

		C = X(p(1:K),:);

		[ obj class ] = myKmeans( X, K , C );
		
	endfor

	%[ obj class ] = min( myKmeans( X, K, C ) );

	C;

	obj;

	class;

endfunction

function [ obj class ] = myKmeans( X, K, C )


	 for i1=1:100

		 D = pdist2(X, C);

		 [minv ind] = min(D');
		 
		 class = ind';

		for i2=1:K

			 indclass = find(class==i2);
			 
			 C(i2,:) = mean(X(indclass,:));

	 	endfor

		D = pdist2(X, C);

		[minv ind] = min(D');
		
		class = ind';
		
		obj = sum( minv );

		O(i1) = obj;

	endfor

	O;

	plotting = []
	
	for i=1:K

		plotting = [ plotting;  O(i) ];

	endfor


	plot(1:K, plotting )

	class;

	
endfunction
