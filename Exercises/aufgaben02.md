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

<p align="center"><img src="/Exercises/tex/1e8d30076177b796797de1597db68e4d.svg?invert_in_darkmode&sanitize=true" align=middle width=99.23873354999999pt height=70.38765194999999pt/></p>

* Solve the sir_ode for the following parameters and initial conditions

<p align="center"><img src="/Exercises/tex/2ceda145c1413594197ebc2f60d5e373.svg?invert_in_darkmode&sanitize=true" align=middle width=210.51310005pt height=110.59361775pt/></p>

* Plot the solutions in configuration space
* Solve the ode for <img src="/Exercises/tex/b855a403df9beca82ce842e87641d959.svg?invert_in_darkmode&sanitize=true" align=middle width=155.81819549999997pt height=21.18721440000001pt/> and plot the solution in phase space. Interpret the plot.
* Repeat the previous step for <img src="/Exercises/tex/8d536b21a7ff9f8d0e2cc6ebf97de72b.svg?invert_in_darkmode&sanitize=true" align=middle width=87.51117704999999pt height=24.65753399999998pt/>
* Simulate the SIR model for <img src="/Exercises/tex/5b7054e279bb5679177c17a7ab787171.svg?invert_in_darkmode&sanitize=true" align=middle width=251.32969455pt height=24.65753399999998pt/> and <p align="center"><img src="/Exercises/tex/c75e0f21a0c2093fc5b61a85f90bf49e.svg?invert_in_darkmode&sanitize=true" align=middle width=105.14631435pt height=13.789957499999998pt/></p>. What difference would you expect for an epidemic in Manhattan (27.500 citizens per <img src="/Exercises/tex/bf0a194b9b51caa4bb09d3ea9a96b97a.svg?invert_in_darkmode&sanitize=true" align=middle width=30.06101009999999pt height=26.76175259999998pt/>) and Mongolia (1,7 citizens per <img src="/Exercises/tex/bf0a194b9b51caa4bb09d3ea9a96b97a.svg?invert_in_darkmode&sanitize=true" align=middle width=30.06101009999999pt height=26.76175259999998pt/>)?

## Exercise 2: Schoolboys dataset

In this exercise, we are going to model the influenza outbreak at the english boarding school in 1978 with the standard SIR model.

1. Find the data in Data/schoolboys.csv and plot the number of sick boys vs time
1. From the data, obtain suitable initial conditions `u0` for <img src="/Exercises/tex/e257acd1ccbe7fcb654708f1a866bfe9.svg?invert_in_darkmode&sanitize=true" align=middle width=11.027402099999989pt height=22.465723500000017pt/>, <img src="/Exercises/tex/21fd4e8eecd6bdf1a4d3d6bd1fb8d733.svg?invert_in_darkmode&sanitize=true" align=middle width=8.515988249999989pt height=22.465723500000017pt/>, <img src="/Exercises/tex/1e438235ef9ec72fc51ac5025516017c.svg?invert_in_darkmode&sanitize=true" align=middle width=12.60847334999999pt height=22.465723500000017pt/> and define `tspan` accordingly.
1. Define the parameter vector `p` with guessed parameters
1. Solve the ODE problem and plot it together with data. Does it fit?
1. Play around with the parameters to obtain a better model fit.
    * From the Lecture script, p. 42: $$\rho = a/r ~200$$





## Cathedral exercise
------------------

What distinguishes our cathedral from all other German Gothic
cathedrals?
