## Finding D-optimal designs without the pain

This Matlab code is intended to find D-optimal and orthogonal designs from an unspecified number of independant parameters in order to design experimental campaigns. It's very easy to use: enter the number of experiments planned and the number of independant parameters of your study. The code will try to find an optimal design for these conditions. We mean by "optimal" the fact that the [variance/covariance matrix](https://en.wikipedia.org/wiki/Covariance_matrix) of the experiments has the maximal possible determinant while being [orthogonal](https://en.wikipedia.org/wiki/Orthogonal_matrix) at the same time. It is fully optimal when the extra-diagonal terms of the variance/covariance matrix are null and the diagonal terms equals. Other configurations are only sub-optimal but still usable with not much risks.

The code generally converges readily for variance/covariance matrix of order 16 and less. Up to order 16, it converges to sub-optimal designs only (unless you let the code running for an unreasonnable amount of time). It can easily produce matrices with the same properties as [Hadamard matrices](https://en.wikipedia.org/wiki/Hadamard_matrix), [Plackett and Burman matrices](https://en.wikipedia.org/wiki/Plackett%E2%80%93Burman_design) or find [factorial designs](https://en.wikipedia.org/wiki/Factorial_experiment). It is limited to two-levels designs in its current version. It uses parallel computing because it is funnier but it can be run on a single core also.

The code itself comes from a loose implementation inspired from [this document](Triefenbach%20(2008)%20The%20D-Optimal%20Approach%20and%20Its%20Implementation%20As%20a%20Computer%20Algorithm.pdf). It tries random substitution of +1/-1 from randomly generated matrices having the same number of +1 and -1 levels for each independant parameter. In other words, this is a constrained brute-force algorithm. I ended to this short and efficient code after many attempts with more complicated optimizations techniques that did not worked as well (for example genetic algorithms). Anyway, **please cite the source in case you use this code.**

## 15 parameters, 16 experiments, D-optimal, orthogonal (+1/-1 levels)
![](Pictures/Figure_converged.png)

## 31 parameters, 32 experiments, nearly D-optimal, nearly orthogonal (+1/-1 levels)
![](Pictures/Figure_incomplete.png)

## 5 parameters, 64 experiments, factorial design retrieved by the code (+1/-1 levels)
![](Pictures/Figure_factorial.png)

## Side note
The way the code is implemented allows very easy modification for adding constraints, other type of optimality, extension to mixture designs, etc. Have fun with it. Maybe one day it will be extended to three or five levels design, maybe.
