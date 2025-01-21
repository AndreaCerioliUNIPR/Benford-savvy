function nsd=NumberOfSignificantDigits(X)
%{
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

%}

X=RoundNumbers(X,8);
[n,k]=size(X);
a=mod(X,10);
multiplier=ones(n,k);
pos01=(a==0);
multiplier(pos01)=0.1;
pos10=(round(a)~=a);
multiplier(pos10)=10;
stop=0;
if sum(sum(multiplier==1))==n*k
    stop=1;
end
while stop==0
    pos=find(multiplier~=1);
    X(pos)=X(pos).*multiplier(pos);
    X(pos)=round(X(pos),5);
    a=mod(X(pos),10);
    pos1=(round(a)==a);
    multiplier(pos(pos1))=1;
    pos01=(a==0);
    multiplier(pos(pos01))=0.1;
    pos10=(round(a)~=a);
    multiplier(pos(pos10))=10;
    if sum(sum(multiplier==1))==n*k
        stop=1;
    end
end
nsd=round(floor(log(X)/log(10)))+1;
nsd=min(nsd,6);
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






