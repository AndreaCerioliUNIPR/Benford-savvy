function X=SimulateSavvyFraudsterNumbers(n,nsim,modelXB,paramXB)
%{
Function for simulating a matrix X of values that mimick the behaviour of 
a "savvy" fraudster, i.e. first digit Benford, other digits not Benford.
 
INPUT
n: double, the number of values declared by the fraudster
nsim: double, the number of simulations
modelXB: string, the distribution for simulating the other significant digits 
         (BenfGen, Uniform, LogNormal or Weibull)
paramXB: double, the parameter of the other significant digits distribution

OUTPUT
X: (n x nsim) matrix of simulated values (doubles)

%}
log10=log(10);
u=rand(n,nsim);
fDnumbers=10.^(u);
oDnumbers=GenerateNumbersXB(n,nsim,modelXB,paramXB);
log10fd=log(fDnumbers)/log10;
sign_fd=10.^(log10fd-floor(log10fd));
fd=floor(sign_fd);
log10od=log(oDnumbers)/log10;    
sign_od=10.^(log10od-floor(log10od));
od=sign_od-floor(sign_od);
X=fd+od;    
end



function numbersXB=GenerateNumbersXB(n,nsim,model,param)
switch model
    case 'BenfGen'
        theta=param;
        u=rand(n,nsim);
        if theta~=0
            x=(u*(10^theta-1)+1).^(1/theta);
            x=max(x,realmin);
        else
            x=10.^(u);
        end
    case 'Uniform'
            x=rand(n,nsim)*param;
    case 'LogNormal'
        mu=param;
        u=mu+randn(n,nsim);
        x=exp(u);    
    case 'Weibull'
        a=param;
        b=1;
        x=wblrnd(a,b,n,nsim);
end
numbersXB=x;
end


