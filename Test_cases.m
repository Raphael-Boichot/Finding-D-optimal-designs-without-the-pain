clc;
clear;
close all

%Inputs for DOE, number of experiments must be > number of parameters
Number_of_experiments=20;   %or parameters of the model, must be even to ensure orthogonality
Number_of_parameters=19;     %independant parameters in the study, can be odd or even
D_matrix_optimizer(Number_of_experiments, Number_of_parameters);

Number_of_experiments=32;   %or parameters of the model, must be even to ensure orthogonality
Number_of_parameters=5;     %independant parameters in the study, can be odd or even
D_matrix_optimizer(Number_of_experiments, Number_of_parameters);