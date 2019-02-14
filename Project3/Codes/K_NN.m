function K_NN
	
	pkg load statistics

	TrainData=load("yeast_train.txt");
	
  	TestData=load("yeast_test.txt");

	%% Read train Data
	Ytrain=TrainData(:,end); %% labes of training

	TrainData(:,end)=[];

	%% Read test Data

	Ytest=TestData(:,end); %% labels of test

	TestData(:,end)=[];

	N=size(TrainData,1); %% Number of training points

	Data=[ TrainData; TestData ];

	Data = Normalize(Data);

	TrainData=Data(1:N,:);

	TestData=Data(N+1:end,:);
  	
	%K = 10;
  
	size(TrainData);
	
	size(TestData);
	
	%Ytest_predict = myKNN(TrainData, TestData, Ytrain, K );

	%average = Cross_validation(TrainData,Ytrain, K );

	%Calculate_error(Ytest_predict, Ytest)

	%average

  	accuracy_variation = [];
  
  	for i=1:20
    
     		accuracy_variation = [ accuracy_variation; Cross_validation(TrainData, Ytrain, i )];
        
  	end    
    
    accuracy_variation
    
    [minv id]=min(accuracy_variation);
     
    best_k = id(1)
        
    minv;
     
    k = 3;
     
    prediction  = myKNN( TrainData, TestData, Ytrain, best_k  );
     
    errors = Calculate_error(prediction, Ytest);
    
    comparison = prediction_actual_label(prediction,Ytest, best_k, errors );
    
  	plot(1:20,accuracy_variation);
    
    knn =  [1, ]
    
    for z = 1:length(knn)
      
      fprintf('\n\nFor k=%d\n', knn(z) );
      
      confusion_matrix = zeros(10,10);
      
      prediction = myKNN(TrainData, TestData, Ytrain, knn(z));
      
      for i=1:10
        
        ac = find(Ytest == i );
        
        for y=1:10
          
          pr = find(prediction == y );
          
          pr = pr';
          
          confusion_matrix(i, y) = sum(ismember(ac,pr));
          
        endfor
        
      endfor 
      
      disp(confusion_matrix);
    
    endfor  

    
endfunction

%% Normalize Data

	%%1. Compute the mean of each column
	%%2. Substract the mean from each entry of the column
	%%3. Find the std of each column 
	%%4. Divide each entry of the column by its std
  
 function comparison =  prediction_actual_label( prediction, Ytest, k, errors )
    
   
   fprintf("Value of k: %d\n", k )
    
   fprintf("Prediction Values: %d  Actual Values %d\n", prediction, Ytest);
   
   n = size(prediction);
   n_2 = size(Ytest);
   
   fprintf("Total number of intances: %d\n", n);
   
   fprintf("Mean Absolute errors: %f\n", errors );

 endfunction
 
   
function Data = Normalize(Data)
 
 %printf(" Calling function Data = Normalize\n")

 for i=1:size(Data,2)
  
    c=Data(:,i)';
    sum(c);
    m=sum(c)./numel(c);
    
    c=c-mean(c);
    
    std(c);
 
    c=c./std(c);
    
    Data(:,i)=c;
   
 endfor
  
endfunction 

%1. Compute distance fom test to train.
		%Dist=Pdist2(TestData, TrainData)
	2. %For each row (each test point )

		%a. Sort the ith row, in ascending order [v ind]=Sort(Dist(i,; )); 

		%b. Pick top k and find their majority label
    
function Ytest_predict=myKNN( TrainData, TestData, Ytrain, K )
  
  #printf("function Ytest_predict = myKNN( TrainData, TestData, Ytrain, K )\n")
 
  Dist = pdist2(TestData, TrainData);
  
  size(Ytrain);
  
  size(TrainData);
  
  for i=1:size(TestData, 1)
    
    [v ind] = sort(Dist(i,:));

    ind(i:K);
    
    Ytrain(ind(i:K));
    
    Ytest_predict(i) = mode(Ytrain(ind(1:K)));
    
  endfor
  
  
  Ytest_predict;
 
endfunction

function errors=Calculate_error(Ytest_predict, Ytest)

  
  n = size(Ytest_predict);
  
  n1  = size(Ytest);
  
  d = Ytest_predict == Ytest';
  
  errors = sum(1-d)./numel(d);

  return
  
endfunction

function avgerr=Cross_validation(TrainData,Ytrain, k)

  #printf("function avgerr=Cross_validation(TrainData,Ytrain, k)\n")  

  c = cvpartition(Ytrain, 'KFold', 10);
 
  sume=0;
  
  for i=1:10

      
    inds=training(c,i);

    trainindex=find(inds==1);
 
    testindex=find(inds==0);
  
    Ytest_predict=myKNN(TrainData(trainindex,:),TrainData(testindex,:),Ytrain(trainindex), k);
      
    Ytest_predict;
           
    e = Calculate_error(Ytest_predict, Ytrain(testindex,:));
    
    sume+=e; 
    
   end
   

  sume;
  
  avgerr=sume/10;
  
endfunction
