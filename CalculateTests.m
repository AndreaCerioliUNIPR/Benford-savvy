function BenfordTests=CalculateTests(X,H0)
%{
Function for calculating the value of different Benford tests on each column of X.
If the null distribution of the tests is provided, it also returns the
corresponding p-values.

INPUT
X: (n x k) matrix of doubles
H0 (optional): struct containing the simulated values of the tests under the null

OUTPUT:
BenfordTests: struct with the following fields:
    - Chi2fd: chi squared test on the first digit distribution
    - Chi2fsd: chi squared test on the first & second digit distribution
    - KSs: Kolmogorov-Smirnov test on significand distribution
    - KUs: Kuiper test on significand distribution
    - KSfs: Kolmogorov-Smirnov test on the fractional of the significand distribution
    - KUfs: Kuiper test on the fractional of the significand distribution
    - Q: Summation (Hotelling-type) test on the first digit (Barabesi et al. 2022)
    - Delta: defined as Q - Chi2fd

For each field of BenfordTests, the following sub-fields are provided:
    * testValue: k-vector containing the values of the test calculated on
    each of the k columns of X
    * pValue (only if H0 was provided): k-vector containing the empirical 
    p-values of the tests calculated with respect to the simulated values 
    in H0.

%}

if nargin<2
    H0=[];
end
C=8;
X=RoundNumbers(X,C);
log10=log(10);
log10x=log(X)/log10;
log10sx=(log10x-floor(log10x));
sx=10.^log10sx;
sx=RoundNumbers(sx,C);
fsx=sx-floor(sx);

%% Digits distributions under the null
d1=(1:9)';
fD1benf=log(1+1./d1)/log10;
d12=(10:99)';
fD12benf=log(1+1./d12)/log10;

%% Digits distributions in x
[n,nsim]=size(sx);
fD1emp=zeros(9,nsim);
D1=floor(round(sx,10));
D1(D1==10)=1;
for i=1:9
    fD1emp(i,:)=sum(D1==i)/n;
end
fD12emp=zeros(89,nsim);
D12=floor(10*round(sx,10));
D12(D12==100)=10;
for i=10:99
    fD12emp(i-9,:)=sum(D12==i)/n;
end

%% To avoid out of memory when n is close to 500
clear x log10x D1 D12;


%% TESTS ON DIGITS DISTRIBUTION
% Chi2 on the first digit
BenfordTests.Chi2fd.testValue=sum(((n*fD1emp-n*fD1benf).^2)./(n*fD1benf));
% Chi2 on the first and second digit
BenfordTests.Chi2fsd.testValue=sum(((n*fD12emp-n*fD12benf).^2)./(n*fD12benf));


%% TESTS ON THE DISTRIBUTION OF THE SIGNIFICAND
% Kolmogorov-Smirnov test on significand distribution
log10sx=sort(log10sx);
OneToN=(1:n)';
BenfordTests.KSs.testValue=sqrtn*max(max((OneToN/n)-log10sx,log10sx-((OneToN-1)/n)));
% Kuiper test on the significand distribution
BenfordTests.KUs.testValue=sqrtn*(max((OneToN/n)-log10sx)+max(log10sx-((OneToN-1)/n)));


%% TESTS ON THE DISTRIBUTION OF THE FRACTIONAL PART OF THE SIGNIFICAND
% Kolmogorov-Smirnov test on the fractional part of the significand distribution
fsx=sort(fsx);
cumProbTeo=zeros(size(sx));
for i=1:length(d1)
    cumProbTeo=cumProbTeo+log((fsx+d1(i))./d1(i))/log10;
end
OneToN=(1:n)';
BenfordTests.KSfs.testValue=sqrtn*max(max((OneToN/n)-cumProbTeo,cumProbTeo-((OneToN-1)/n)));
% Kuiper test on the fractional part of the significand distribution
BenfordTests.KUfs.testValue=sqrtn*(max((OneToN/n)-cumProbTeo)+max(cumProbTeo-(OneToN-1)/n));


%% SUMMATION AND DELTA TESTS
% Summation (Hotelling-type) test (Barabesi et al. 2022)
BenfordTests.Q.testValue=SummationTestQ(sx);
% New test Delta = Summation Test - ChiSquare First Digit
BenfordTests.Delta.testValue=BenfordTests.Q.testValue-BenfordTests.Chi2fd.testValue;


%% P-VALUES CALCULATION (IF H0 HAS BEEN PROVIDED)
if ~isempty(H0)
    allFields=fieldnames(BenfordTests);
    for j=1:length(allFields)
        testValue=BenfordTests.(allFields{j}).testValue;
        testValueH0=H0.(allFields{j}).testValue;
        BenfordTests.(allFields{j}).pValue=MonteCarloPval(testValue,testValueH0);        
    end
end
end


function Q=SummationTestQ(sx)
[n,k]=size(sx);
d=(1:9)';
digit=floor(sx);
h=length(d);
Q=zeros(h,k);
for i=1:h
    pos=(digit==d(i));
    Q(i,:)=sum(sx.*pos)/n;
end
C=1/log(10);
Sigma=diag(C*(d+0.5-C));
Sigma(Sigma==0)=-C^2;
Sigma_1=Sigma\eye(length(d));
Q=n*sum((Sigma_1*(Q-C)).*(Q-C));
end


function Pval=MonteCarloPval(x,MonteCarloDistr)
if nargin<2
    MonteCarloDistr=x;
end
n1=length(x);
n2=length(MonteCarloDistr);
X1=[x' zeros(n1,1) (1:n1)'];
X2=[MonteCarloDistr' ones(n2,1) zeros(n2,1)];
XX=[X1;X2];
XX=sortrows(XX,1,'descend');
F=cumsum(XX(:,2))/n2;
pos=XX(:,3);
Pval=sortrows([pos(pos>0) F(pos>0)],1);
Pval=Pval(:,2)';
end   


function xr=RoundNumbers(x,C)
minx=min(min(x));
if minx<1
    c=floor(log(min(x(x>0)))/log(10));
    c=max(abs(c),C);
    xr=round(x,c);
else
    xr=round(x,C);
end
end


