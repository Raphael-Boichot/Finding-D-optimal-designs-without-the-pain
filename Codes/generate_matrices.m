function [Matrix]=generate_matrices(Number_of_experiments, Number_of_parameters)
%-----------------------------------------------------------
Matrix=2*(rand(Number_of_experiments, Number_of_parameters,1)>0.5)-1;
for i=1:1:Number_of_parameters
    column=Matrix(:,i);
    if sum(column)<0
        while not(sum(column))==0
            line=ceil(rand*Number_of_experiments);
            if column(line)==-1
                column(line)=+1;
            end
        end
    end
    if sum(column)>0
        while not(sum(column))==0
            line=ceil(rand*Number_of_experiments);
            if column(line)==+1
                column(line)=-1;
            end
        end
    end
    Matrix(:,i)=column;
end
%---------------------------------------------------------------
for k=1:1:(Number_of_parameters*Number_of_experiments)^2
    Matrix_test=Matrix;
    column=ceil(rand*Number_of_parameters);
    Flag=1;
    while Flag==1
        line=ceil(rand*Number_of_experiments);
        if Matrix_test(line,column)==+1
            Matrix_test(line,column)=-1;
            Flag=0;
        end
    end
    Flag=1;
    while Flag==1
        line=ceil(rand*Number_of_experiments);
        if Matrix_test(line,column)==-1
            Matrix_test(line,column)=+1;
            Flag=0;
        end
    end
    %sum(abs(sum(Matrix_test)))
    if det(Matrix_test'*Matrix_test)>det(Matrix'*Matrix)
        Matrix=Matrix_test;
    end
end