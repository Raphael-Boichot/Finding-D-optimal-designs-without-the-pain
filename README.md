# Finding D-optimal designs without the pain for your DOE

This Matlab code is intended to find D-optimal and orthogonal designs from an unspecified number of independant parameters in order to design experimental campaigns. It's very easy to use: enter the number of experiments planned and the number of independant parameters of your study. The code will try to find an optimal design for these conditions. We mean by "optimal" the fact that the [variance/covariance matrix]() of the experiments has the maximal possible determinant while being [orthogonal]() at the same time. It is fully optimal when the extra-diagonal terms of the variance/covariance matrix are null and the diagonal terms equals. Other configurations are only sub-optimal but still usable with not much risks.

The code generally converges readily for variance/covariance matrix of order 16 and less. Up to 16 it converges to sub-optimal designs only. It can easily produce matrices with the same properties as [Hadamard matrices], [Plackett and Burman matrices]() or find [factorial designs](). It is limited to two-levels designs in its current version.

The code is a loose implementation of [this algorithm](). It tries random substitution of +1/-1 from randomly generated matrices having the same number of +1 and -1 level for each independant parameter.


