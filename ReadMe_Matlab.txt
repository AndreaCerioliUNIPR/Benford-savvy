This folder contains MATLAB codes that can be used for generating part of the results presented in the article.
In particular, the following functions are present: 
_______________________________________________________________________________________________________

CalculateTests.m

Function for calculating the value of different Benford tests on each column of X.
If the null distribution of the tests is provided, it also returns the
corresponding p-values.

INPUT
X: (n x k) matrix of doubles
H0 (optional): struct containing the simulated values of the tests under the null

OUTPUT:
BenfordTests: struct with the following fields:
    - Chi2fd: chi squared test on the first digit (Q_1 in the paper)
    - Chi2fsd: chi squared test on the first & second digit (Q_{12} in the paper)
    - KSs: Kolmogorov-Smirnov test on significand (KS_1 in the paper)
    - KUs: Kuiper test on significand (KU_1 in the paper)
    - KSfs: Kolmogorov-Smirnov test on the fractional part of the significand (KS_2 in the paper)
    - KUfs: Kuiper test on the fractional part of the significand (KU_2 in the paper)
    - Q: Summation (Hotelling-type) test on the first digit (Barabesi et al. 2022) (Q_2 in the paper)
    - Delta: difference statististic defined as Q - Chi2fd (Q_{Delta} in the paper)

For each field of BenfordTests, the following sub-fields are provided:
    * testValue: k-vector containing the values of the test calculated on
    each of the k columns of X
    * pValue (only if H0 was provided): k-vector containing the empirical 
    p-values of the tests calculated with respect to the simulated values 
    in H0.
_______________________________________________________________________________________________________

NumberOfSignificantDigits.m

Function for calculating the number of significant digits of each value in
X.

INPUT
X: (n x k) matrix of doubles

OUTPUT:
nsd: (n x k) matrix containing the number of significant digits of each
value of X

EXAMPLES
nsd=NumberOfSignificantDigits(0.02003) --> 4
nsd=NumberOfSignificantDigits(1200000) --> 2
_______________________________________________________________________________________________________

NullDistributions.m

Function for simulating 1,000,000 values of the Benford tests under the
null.

INPUT
x: k-vector of doubles

OUTPUT:
H0: struct containing the simulated values of the tests under the null
H0r: struct containing the simulated values of the tests under the null
obtained by replicating the same rounding structure of the input vector x
(see the truncated-Benford algorithm of the paper)

H0 and H0r have the following fields:
    - Chi2fd: chi squared test on the first digit (Q_1 in the paper)
    - Chi2fsd: chi squared test on the first & second digit (Q_{12} in the paper)
    - KSs: Kolmogorov-Smirnov test on significand (KS_1 in the paper)
    - KUs: Kuiper test on significand (KU_1 in the paper)
    - KSfs: Kolmogorov-Smirnov test on the fractional part of the significand (KS_2 in the paper)
    - KUfs: Kuiper test on the fractional part of the significand (KU_2 in the paper)
    - Q: Summation (Hotelling-type) test on the first digit (Barabesi et al. 2022) (Q_2 in the paper)
    - Delta: difference statististic defined as Q - Chi2fd (Q_{Delta} in the paper)
_______________________________________________________________________________________________________

SimulateSavvyFraudsterNumbers.m

Function for simulating a matrix X of values that mimic the behavior of 
a "savvy" fraudster, i.e. first digit Benford, other digits not Benford
(see the manipulated-Benford contamination model of the paper).
 
INPUT
n: double, the number of values declared by the fraudster
nsim: double, the number of simulations
modelXB: string, the distribution for simulating the other significant digits 
         (BenfGen, Uniform, LogNormal or Weibull)
paramXB: double, the parameter of the other significant digits distribution

OUTPUT
X: (n x nsim) matrix of simulated values (doubles)
_______________________________________________________________________________________________________


