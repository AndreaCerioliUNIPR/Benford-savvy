# Benford-savvy

Files used for simulations in the paper and the Supplementary Material titled:

# Protecting Against Adversarial Contamination in Benford’s Law


> **Note:** This repository contains code and instructions for replicating the results of a paper currently under peer review. 

## Abstract

We address the task of identifying anomalous observations by analyzing
digits under the lens of Benford’s law. Motivated by the statistical analysis of
customs declarations, we answer one major and still open question: How can
we detect the behavior of operators who are aware of the prevalence of the
Benford’s pattern in the digits of regular observations and try to manipulate
their data in such a way that the same pattern also holds after data fabrica-
tion? This challenge arises from the ability of highly skilled and strategically
minded manipulators in key organizational positions or criminal networks to
exploit statistical knowledge and evade detection. For this purpose, we write
a specific contamination model for digits, investigate distributional results on
the fractional part of the significand and derive appropriate goodness-of-fit
statistics for the considered adversarial testing problem. Along our path, we
also unveil the peculiar relationship between two simple conformance tests
based on the distribution of the first digit. We show the empirical properties
of the proposed tests through a simulation exercise and application to real data
from international trade transactions. Although we cannot claim that our re-
sults are able to anticipate data fabrication with certainty, they surely point to
situations where more substantial controls are needed. Furthermore, our work
can reinforce trust in data integrity in many critical domains where mathemat-
ically informed misconduct is suspected.


## Results replication: requirements and setup

The repository provides the MATLAB and FORTRAN code and the data necessary to replicate the 
results from both the main manuscript and the supplementary 
information document. These codes can be used in two modalities: 
- 1) In a standalone MATLAB licensed installation; 
- 2) In the license-free MATLAB Online platform, which can be used up to 20 hours 
     a month: https://it.mathworks.com/products/matlab-online.html

In both cases, you have to clone this repository: 
`git clone https://github.com/AndreaCerioliUNIPR/Benford-savvy.git`

The anonymized and ordered  significands used in our applications for Operator A and B 
are available in the files *sig_A.txt* and *sig_B.txt* respectively.

These and other Benford's tests are being implemented in the FSDA toolbox for MATLAB,
which can be installed from the "Install App" of the standard MATLAB distribution.


## Description of the repository files


| FileName                          | Description                             | 
|-----------------------------------|-----------------------------------------|
|`CalculateTests.m`:                | generate Figure 3                       | 
|`FMatlab_mex.zip`:                 | generate Figure 6  <br> and SI-Figure 1 | 
|`NullDistributions.m`:             | generate Figure 7  <br> and SI-Figure 2 | 
|`NumberOfSignificantDigits.m`:     | generate Figure 8                       | 
|`SimulateSavvyFraudsterNumbers.m`: | generate Figure 9                       | 
|`TestBenford_input.zip`:           | generate Figure 10                      | 
|`TestBenford_public.for`:          | generate Figure 11 <br> and SI-Figure 5 | 
|`sig_A.txt`:                       | generate Figure 12 <br> and SI-Figure 6 | 
|`sig_B.txt`:                       | generate Figure 13 <br> and SI-Figure 7 | 




<!---
this part is commented
--->
