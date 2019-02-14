
function K_NN
	
	%clear all
	pkg load statistics
		
	TrainData=load('wine_train.txt');
	
	TestData=load('wine_test.txt');

	%% Read train data
	Ytrain = (TestData(:,end)); %% labels for training
	
	TrainData(:,end)=[];
  
	%%Read test Data
	Ytest=TestData(:,end); %% labels for testing
	
	TestData(:,end)=[];
	
	N=size(TrainData, 1 ); %% Number of training points

	Data = [TrainData; TestData];
	
  	Data = Normalize(Data);
  
  	TrainData=Data(1:N,:);
  	
	TestData=Data(N+1:end,:);
  	
	K = 5;
	
	size(TrainData);
	
	size(TestData);

	Ytest_predict = myKNN(TrainData, TestData, Ytrain, K );
  
	Calculate_error(Ytest_predict, Ytest);

 endfunction

%% Normalize Data

	%%1. Compute the mean of each column
	%%2. Substract the mean from each entry of the column
	%%3. Find the std of each column 
	%%4. Divide each entry of the column by its std

function Data = Normalize(Data)
  
  for i=1:size(Data,2)
    
    Data(:,i)=Data(:,i)-mean(Data(:,1));
    
    Data(:,i)=Data(:,i)./std(Data(:,i));
    
  endfor
  
endfunction 

%1. Compute distance fom test to train.
		%Dist=Pdist2(TestData, TrainData)
	2. %For each row (each test point )

		%a. Sort the ith row, in ascending order [v ind]=Sort(Dist(i,; )); 

		%b. Pick top k and find their majority label
    
function Ytest_predict = myKNN( TrainData, TestData, Ytrain, K )
  
  Dist = pdist2(TestData, TrainData);
  
  size(Ytrain);
  
  size(TrainData);
  
  for i=1:size(TestData, 1)
    
    [v ind] = sort(Dist(i,:));

    ind(i:K);
    
    Ytrain(ind(i:K));
    
    Ytest_predict(i) = mode(Ytrain(ind(1:K)));
    
  endfor
  
  Ytrain;

  Ytest_predict
 
endfunction

function Calculate_error(Ytest_predict, Ytest )
  
  d = Ytest_predict = Ytest';
  
  errors = sum(1-d)./numel(d);
  
  errors
  
endfunction


 
