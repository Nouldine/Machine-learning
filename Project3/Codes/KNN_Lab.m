function KNN_lab

pkg load statistics

TrainData=dlmread('wine_train.txt');
TestData=dlmread('wine_test.txt');

%%Read train data
Ytrain = TrainData(:,end); %% labels for training
TrainData(:,end) = [];

%%Read test Data
Ytest = TestData(:,end); %% labels for testing
TestData(:,end) = [];
N= size(TrainData,1); %%Number of training points

Data = [TrainData; TestData]
Data = Normalize(Data);
TrainData = Data(1:N,:);
TestData = Data(N+1:end,:);

K= 5
size(TrainData);
size(TestData);
Ytest_predict = myKNN(TrainData, TestData, Ytrain, K);
Calculate_error(Ytest_predict, Ytest)
endfunction

function Data = Normalize(Data)
  
  for i=1:size(Data,2)
      Data(:,i) = Data(:,i)-mean(Data(:,1));
      Data(:,i) = Data(:,i)./std(Data(:,i));
  endfor
endfunction

function Ytest_predict=myKNN(TrainData,TestData,Ytrain, K)
  Dist = pdist2(TestData,TrainData);
  size(Ytrain);
  for i =1:size(TestData,1)
    [v ind] = sort(Dist(i,:));
    ind(i:K);
    
    Ytrain(ind(i:K));
    
  
    Ytest_predict(i) = mode(Ytrain(ind(1:K)));
    
  endfor
Ytest_predict
endfunction

function Calculate_error(Ytest_predict, Ytest)
  d = Ytest_predict == Ytest';
  error = sum(1-d)./numel(d);
  error
endfunction
