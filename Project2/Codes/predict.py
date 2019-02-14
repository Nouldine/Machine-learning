

def predict(row, coefficients):
    
    yhat = coefficients[0]
    
    for i in range(len(row)-1):
    
        yhat += coefficients[i + 1] * row[i]
    
    return 1.0 / (1.0 + exp(-yhat))

dataset = [[ 100, 50, 1 ]];

coef = [ .01, 0.01, 10 ]

for row in dataset:

    yhat = predict( row, coef )
    print("Expected=%.3f, Predicted=%.3f [%d]" % (row[-1], yhat, round(yhat))


