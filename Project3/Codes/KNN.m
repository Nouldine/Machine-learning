

function KN 
  pkg load statistics;
  
TrainData=load("wine_train.txt");
TestData=load("wine_test.txt");

%% Read train Data
Ytrain=TrainData(:,end); %% labes of training

TrainData(:,end)=[];

%% Read test Data

Ytest=TestData(:,end); %% labels of test

TestData(:,end)=[];
 
N=size(TrainData,1); %% Number of training points

Data=[TrainData; TestData ];
 
Data = Normalize(Data);

TrainData=Data(1:N,:);

TestData=Data(N+1:end,:);

k = 5;

Ytest_predict = mykNN(TrainData, TestData, Ytrain, k )

endfunction

function Data = Normalize(Data)
  
  for i=1:11
    
    Data(:,i) = Data(:,i)-mean(Data(:,1));
    Data(:,i) = Data(:,i)./std(Data(:,i));
    
  endfor

 endfunction
  
function mykNN( TrainData,  TestData, Ytrain, k )
    
    Dist=pdist2(TestData, TrainData )
    
    for i=1:size(TestData,1)
      
      [v ind] = sort(Dist(i,:));
      
      Ytest_predict(i) = Mode(YTrain(ind(1:k)));
      
    endfor
    
   endfunction
      
    


