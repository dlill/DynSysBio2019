# Tutorial 2

## Solving ODEs using DifferentialEquations.jl

What it takes to solve an ODE

* Problem
    1. ODE `function(u,p,t)`
    1. Boundary conditions `u0`
    1. Parameters `p`
    1. Time range (for numerics) `(tstart, tend)`
*  Solution
    1. Ansatz / algorithm


Many algorithms for solving ODEs have been implemented in [DifferentialEquations.jl](http://docs.juliadiffeq.org/latest/index.html)

To solve an ODE with DifferentialEquations, first pose the complete ODE problem with `ODEProblem()`.
```
function ode(u,p,t)
  ...
  return(du)
end

u0 = [1. ... ]
p = [1.1 ...]
t = (0.0 10.0) # don't forget the dots!

ode_problem = ODEProblem(ode, u0, t, p)
```


Then solve it with `solve()`
```
solution = solve(ode_problem)
```

## Exercise 0: Install needed packages

Install the packages `DifferentialEquations` and `CSV`.

## Exercise 1: SIR-Models - general exploration


* Implement the ODE of the SIR model as function `sir_ode`

$$
\begin{aligned}
  \dot{S} & = - r  S  I \\
  \dot{I} & =   r  S  I - a I \\
  \dot{R} & = a I
\end{aligned}
$$

* Solve the sir_ode for the following parameters and initial conditions

$$
\begin{aligned}
r & = 0.1 \\
a & = 50 \\
R(t = 0) & = 0 \\
S(t = 0) & = 450 \\
N & = R + S + I = 1000 \\
\end{aligned}
$$

* Plot the solutions in configuration space.
  Plotting documentation: (DifferentialEquations)[http://docs.juliadiffeq.org/latest/basics/plot.html] and (Plots)[http://docs.juliaplots.org/latest/]
  Helpful arguments for the plot function: `vars`, `seriestype`, `linestyle`
* Solve the ode for $r \in  {0.1, 0.15, 0.2, ... 0.5}$ and plot the solution in phase space. Interpret the plot.
* Repeat the previous step for $I(t = 0) = 1$
* Simulate the SIR model for $ I(0) = 50, R (0) = 0, S \in [100,1000]$ and $ r = 0.1, a = 10$. What difference would you expect for an epidemic in Manhattan (27.500 citizens per $km^2$) and Mongolia (1,7 citizens per $km^2$)?

## Exercise 2: Schoolboys dataset

In this exercise, we are going to model the influenza outbreak at the english boarding school in 1978 with the standard SIR model.

1. Find the data in Data/schoolboys.csv and plot the number of sick boys vs time
1. From the data, obtain suitable initial conditions `u0` for $S$, $I$, $R$ and define `tspan` accordingly.
1. Define the parameter vector `p` with guessed parameters
1. Solve the ODE problem and plot it together with data. Does it fit?
1. Play around with the parameters to obtain a better model fit.
    * From the Lecture script, p. 42: $$\rho = a/r ~200$$





## Cathedral exercise
------------------

What distinguishes our cathedral from all other German Gothic
cathedrals?
