clc;
clear;
close all

%Inputs for DOE, number of experiments must be > number of parameters
Number_of_experiments=16;   %or parameters of the model, must be even to ensure othogonality
Number_of_parameters=15;    %independant parameters in the study, can be odd or even
size_of_a_batch=16;         %number of jobs treated simultaneously in parallel

%test case
H=hadamard(16);
H=H(:,2:end);
disp(['Test case log10(determinant)=',num2str(log10(det(H'*H)))])

%Initialization
rng('shuffle', 'twister')
figure('Position',[100 100 1400 400]);
colormap hot

Matrix_best=2*(rand(Number_of_experiments, Number_of_parameters,1)>0.5)-1;
End_flag=1;
g=0;
while End_flag==1
    g=g+1;

    disp(['Sending a batch of ',num2str(size_of_a_batch),' jobs in parallel...'])
    parfor i=1:size_of_a_batch
        [Matrix_batch(:,:,i)]=generate_matrices(Number_of_experiments, Number_of_parameters);
    end
    disp('Batch terminated, sorting the results')

    for i=1:size_of_a_batch
        Matrix=Matrix_batch(:,:,i);
        if det(Matrix'*Matrix)>det(Matrix_best'*Matrix_best);
            Matrix_best=Matrix;
            disp(['Better configuration found, Log10 det=',num2str(log10(det(Matrix_best'*Matrix_best))), ', Batch=',num2str(g)])

            subplot(1,3,1);
            imagesc(Matrix_best'*Matrix_best);
            title('variance/covariance matrix');

            subplot(1,3,2);
            imagesc(Matrix_best);
            title('Best matrix');

            subplot(1,3,3);
            imagesc(Matrix_best*(Matrix_best'*Matrix_best)^-1*Matrix_best');
            title('Projection matrix');

            saveas(gcf,'Figure.png');
            save Best_matrix.txt Matrix_best -ascii
        end
    end

    cov=Matrix_best'*Matrix_best;
    if sum(abs(sum(cov-diag(diag(cov)))))==0;
        End_flag=0;
        disp('End of optimization, best matrix found:')
        Matrix_best
    end
end

