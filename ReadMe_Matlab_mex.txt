The folder Matlab_mex.zip contains three files which provide a Matlab wrapper to a 
compatible version (i.e., without IMSL routines) of the Fortran code used to obtain 
the simulation results presented in the article:

- Benf.mexw64 
This file has been obtained by compiling the Fortran file Benf_mex.f (see below)
in Matlab using the mex function. 
It can be executed in Matlab writing "Benf".
Benf can be executed on Windows intel (Amd) x64 machines.


- dksone.m 
This file is a Matlab function required by Benf.mexw64 during the execution.
It must be located in the same directory as Benf.mexw64.


- Benf_mex.f
This file is the compatible version of TestBenford_public.for, which does not
require IMSL routines and functions. 
It contains the necessary insertions and modifications which are required 
to obtain the executable mex file Benf.mexw64.
This file is not strictly necessary for Windows users, who can directly execute 
Benf.mexw64 from Matlab as described above. However, it is provided in order to 
allow the user both to double-check the computations and to obtain executable 
Matlab files under different operating systems. 


  

  
  
