# Benford-savvy 

Files used for simulations in the paper and the Supplementary Material titled:

# Protecting Against Adversarial Contamination in Benford’s Law


> **Note:** This repository contains code and instructions for replicating the results of a paper currently under peer review. 

## Abstract

Motivated by the task of identifying anomalous observations through the analysis of digits under the lens of Benford’s law, we answer one major and still open question: How can we detect the behavior of operators who are aware of the prevalence of the Benford's pattern in the digits of regular observations and try to manipulate their data in such a way that the same pattern also holds after data fabrication? This challenge arises from the ability of strategically minded manipulators to exploit statistical knowledge and evade detection. To achieve our purpose, we write a specific contamination model for digits, obtain new relevant distributional results and derive appropriate goodness-of-fit statistics for the considered adversarial testing problem. Along our path, we also unveil the relationship between two simple conformance tests based on the distribution of the first digit. We show the empirical properties of the proposed tests through a simulation exercise and application to real data from international trade transactions. Although we cannot claim that our results are able to anticipate data fabrication with certainty, they surely point to situations where more substantial controls are needed. Furthermore, our work can reinforce trust in data integrity in critical domains where mathematically informed misconduct is suspected.



## Description of the repository files

| FileName                          | Description                             | 
|-----------------------------------|-----------------------------------------|
|`CalculateTests.m`:                | Function for calculating the value of different Benford tests on each column of X. If the null distribution of the tests is provided, it also returns the corresponding p-values. | 
|`FMatlab_mex.zip`:                 | The zip extracts a folder with three files which provide a Matlab wrapper to a compatible version (i.e., without IMSL routines) of the Fortran code used to obtain the simulation results presented in the article. | 
|`NullDistributions.m`:             | Function for simulating 1,000,000 values of the Benford tests under the null. | 
|`NumberOfSignificantDigits.m`:     | Function for calculating the number of significant digits of each value in X. | 
|`SimulateSavvyFraudsterNumbers.m`: | Function for simulating a matrix X of values that mimic the behavior of a "savvy" fraudster, i.e. first digit Benford, other digits not Benford (see the manipulated-Benford contamination model of the paper). | 
|`TestBenford_public.for`:          | Fortran code that can be used for replicating the simulation results presented in the article. More info in *ReadMe_Fortran.txt* | 
|`TestBenford_input.zip`:           | Input files required by the Fortran code. Each input file also includes a brief description of the parameters that the file itself contains.  More info in *ReadMe_Fortran.txt* | 
|`sig_A.txt`:                       | anonymized and ordered significands used in our applications for Operator A | 
|`sig_B.txt`:                       | anonymized and ordered significands used in our applications for Operator B | 

More information on the MATLAB functions' input-output can be found in the file *ReadMe_Matlab.txt*.

More information on the content of the *FMatlab_mex.zip* can be found in the file *ReadMe_Matlab_mex.txt*.


## Results replication: requirements and setup

The MATLAB and FORTRAN codes can be used in two modalities: 
- 1) In a standalone MATLAB licensed installation; 
- 2) In the license-free MATLAB Online platform, which can be used up to 20 hours 
     a month: https://it.mathworks.com/products/matlab-online.html

In both cases, you have to clone this repository: 
`git clone https://github.com/AndreaCerioliUNIPR/Benford-savvy.git`

### Upcoming: distribution in FSDA 

These and other Benford-based tests are currently being integrated into the
*FSDA* toolbox for MATLAB. The integration is in progress, and we expect to release it soon.
Once available, the toolbox—along with all relevant functions from this repository 
needed to apply the tests proposed in our paper—will be installable directly via 
the *“Install App”* feature in the standard MATLAB distribution.

More information about the free FSDA MATLAB Add-On is available at:
*https://it.mathworks.com/matlabcentral/fileexchange/72999-fsda-flexible-statistics-data-analysis-toolbox*.

FSDA requires the Statistical and Machine Learning Toolbox. 
The Parallel Computing Toolbox is also recommended to speed up computations.



<!---
this part is commented
--->
