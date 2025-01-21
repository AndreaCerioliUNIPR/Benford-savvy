function [H0,H0r]=NullDistributions(x)
%{
Function for simulating 1,000,000 values of the Benford tests under the
null.

INPUT
x: k-vector of doubles

OUTPUT:
H0: struct containing the simulated values of the tests under the null
H0r: struct containing the simulated values of the tests under the null
obtained by replicating the same rounding structure of the input vector x

H0 and H0r have the following fields:
    - Chi2fd: chi squared test on the first digit distribution
    - Chi2fsd: chi squared test on the first & second digit distribution
    - KSs: Kolmogorov-Smirnov test on significand distribution
    - KUs: Kuiper test on significand distribution
    - KSfs: Kolmogorov-Smirnov test on the fractional of the significand distribution
    - KUfs: Kuiper test on the fractional of the significand distribution
    - Q: Summation (Hotelling-type) test on the first digit (Barabesi et al. 2022)
    - Delta: defined as Q - Chi2fd
%}

C=8;
x=RoundNumbers(x,C);
log10=log(10);
log10x=log(x)/log10;
log10sx=(log10x-floor(RoundNumbers(log10x,C)));
sx=10.^log10sx;
sx=RoundNumbers(sx,C);
ssx=sort(sx);
nsd=NumberOfSignificantDigits(ssx);
n=length(ssx);
if n<200 
    [benf,benfRound]=SimulateBenfNumbers(n,1000000,nsd);
    H0=CalculateTests(benf,[]);
    H0r=CalculateTests(benfRound,[]);
    allFields=fieldnames(H0);
    for j=1:length(allFields)
        testValue=H0.(allFields{j}).testValue;
        H0.(allFields{j}).pValue=MonteCarloPval(testValue,testValue);
        testValue=H0r.(allFields{j}).testValue;
        H0r.(allFields{j}).pValue=MonteCarloPval(testValue,testValue);
    end
else
    nBlocks=10;
    simPerBlock=10000;
    [benf,benfRound]=SimulateBenfNumbers(n,1,nsd);
    H0=CalculateTests(benf,[]);
    H0r=CalculateTests(benfRound,[]);
    allFields=fieldnames(H0);
    testValues=zeros(length(allFields),simPerBlock,nBlocks);
    testValuesR=zeros(length(allFields),simPerBlock,nBlocks);
    parfor i=1:nBlocks
        [benf,benfRound]=SimulateBenfNumbers(n,simPerBlock,nsd);
        H0i=CalculateTests(benf,[]);
        H0ri=CalculateTests(benfRound,[]);
        temp=zeros(length(allFields),simPerBlock);
        tempRound=zeros(length(allFields),simPerBlock);
        for j=1:length(allFields)
            temp(j,:)=H0i.(allFields{j}).testValue;
            tempRound(j,:)=H0ri.(allFields{j}).testValue;
        end
        testValues(:,:,i)=temp;
        testValuesR(:,:,i)=tempRound;
    end
    for j=1:length(allFields)
        testValuesJ=reshape(testValues(j,:,:),1,nBlocks*simPerBlock);
        H0.(allFields{j}).testValue=testValuesJ;
        testValuesJ=reshape(testValuesR(j,:,:),1,nBlocks*simPerBlock);
        H0r.(allFields{j}).testValue=testValuesJ;
    end
end
end



function [benf,benfRound]=SimulateBenfNumbers(n,nsim,nsd)
if isempty(nsd)
    u=rand(n,nsim);
    benf=10.^(u);
    benfRound=benf;
else
    nsd=nsd*ones(1,nsim);
    coin0=sort(rand(n,nsim));
    benf=10.^coin0;
    benfRound=round(floor(benf.*(10.^(nsd-1))));
end
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




