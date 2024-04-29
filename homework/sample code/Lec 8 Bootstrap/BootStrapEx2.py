import numpy as np
import statsmodels.api as sm
data = open("lmData.csv")
myData = np.loadtxt(data, delimiter=",", skiprows=1)
x = myData[:, 0]
y = myData[:, 1]

# Adding a constant column for the intercept
X = sm.add_constant(x, prepend=False)

# Define the simple regression model
mod1 = sm.OLS(y, X)
# Fit the OLS model
results = mod1.fit()
# Get the fitted values
yHat = results.fittedvalues
# Get the residuals
noise = y - yHat
# Set bootstrap size
n = 10000

# define a vector of zeros
beta1 = np.zeros(n)
beta1[0] = results.params[0]
for i in np.arange(1, 10000):
    residBoot = np.random.choice(noise, 100, replace=True)  # use np.random.permutation(noise) if without replace
    yBoot = yHat + residBoot
    modBoot = sm.OLS(yBoot, X)
    resultsBoot = modBoot.fit()
    beta1[i] = resultsBoot.params[0]

print(np.mean(beta1))
print(np.std(beta1))