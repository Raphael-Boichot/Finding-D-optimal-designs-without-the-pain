clc;
clear;
close all

%Inputs for DOE, number of experiments must be > number of parameters
Number_of_experiments=16;   %or parameters of the model, must be even to ensure othogonality
Number_of_parameters=4;     %independant parameters in the study, can be odd or even
D_matrix_optimizer(Number_of_experiments, Number_of_parameters);

Number_of_experiments=8;   %or parameters of the model, must be even to ensure othogonality
Number_of_parameters=7;     %independant parameters in the study, can be odd or even
D_matrix_optimizer(Number_of_experiments, Number_of_parameters);