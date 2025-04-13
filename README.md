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

<!---


| FileName | Description | View 👀 | Run ▶️ | Jupiter notebook |
|----------|---------|---------|--------|-----------------|
|`Figure3.mlx`:     | generate Figure 3  | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure3.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure3.mlx) | [Figure3.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure3.ipynb) |
|`Figure6.mlx`:     | generate Figure 6  <br> and SI-Figure 1 | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure6.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure6.mlx) | [Figure6.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure6.ipynb) |
|`Figure7.mlx`:     | generate Figure 7  <br> and SI-Figure 2 | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure7.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure7.mlx) | [Figure7.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure7.ipynb) |
|`Figure8.mlx`:     | generate Figure 8  | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure8.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure8.mlx) | [Figure8.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure8.ipynb) |
|`Figure9.mlx`:     | generate Figure 9  | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure9.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure9.mlx) | [Figure9.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure9.ipynb) |
|`Figure10.mlx`:    | generate Figure 10 | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure10.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure10.mlx) | [Figure10.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure10.ipynb) |
|`Figure11.mlx`:    | generate Figure 11 <br> and SI-Figure 5 | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure11.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure11.mlx) | [Figure11.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure11.ipynb) |
|`Figure12.mlx`:    | generate Figure 12 <br> and SI-Figure 6 | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure12.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure12.mlx) | [Figure12.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure12.ipynb) |
|`Figure13.mlx`:    | generate Figure 13 <br> and SI-Figure 7 | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigure13.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure13.mlx) | [Figure13.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure13.ipynb) |
|`Figure14_15.mlx`: | generate Figure 14 <br> and Figure 15| [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2F08d4bae2-8614-4b62-a28e-15322e2d53ac%2F1742743193%2Ffiles%2FFigures14_15.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Figure14_15.mlx) | [Figure14_15.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Figure14_15.ipynb) |
|`Table1.mlx`  :    | generate Table 1   | [![File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fwww.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2Ff026de45-4ab8-44ed-85a3-1549ae68987b%2F1741121020%2Ffiles%2FFigure15.mlx&embed=web) | [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/tdist-MCD&file=Table1.mlx) | [Table1.ipynb](https://github.com/UniprJRC/tdist-MCD/blob/main/Table1.ipynb) |

--->
