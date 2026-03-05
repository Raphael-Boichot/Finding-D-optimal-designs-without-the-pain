function [flag, failedRows] = checkDiagDominance(A)
% checkDiagDominance checks if the diagonal element in each row is
% strictly larger than all other elements in the same row.
% flag - true if all rows satisfy the condition
% failedRows - row indices that do not satisfy the condition
% dev note : in theory having the values on the diagonal (leverage) equal is enough to
% validate the hat matrix optimality (saturatiion). BUT I do not find exact factorial designs
% without this check, so it's a bit strictier than required. Hopefully I do
% no find cases where this check is not associated with the values equal on
% the leverage...

[n, m] = size(A);
if n ~= m
    error('Matrix must be square.');
end

flag = true;       % assume true
failedRows = [];   % list of failing rows

for i = 1:n
    diagVal = (A(i,i));
    rowVals = (A(i,:));
    rowVals(i) = [];  % remove diagonal element
    if any(rowVals >= diagVal)
        flag = false;
        failedRows = [failedRows i];
    end
end