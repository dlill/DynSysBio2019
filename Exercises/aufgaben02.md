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


1. Implement the ODE of the SIR model as function `sir_ode`
<p align="center"><img src="/Exercises/tex/1e8d30076177b796797de1597db68e4d.svg?invert_in_darkmode&sanitize=true" align=middle width=99.23873354999999pt height=70.38765194999999pt/></p>
1. Solve the sir_ode for the following parameters and initial conditions
<p align="center"><img src="/Exercises/tex/5e8bdd9dca20dd75c8e11f4e358a8045.svg?invert_in_darkmode&sanitize=true" align=middle width=210.62142914999998pt height=110.59361775pt/></p>
1. Plot the solutions in configuration space
1. Solve the ode for <img src="/Exercises/tex/8c723919409afea4c73bc987caf64142.svg?invert_in_darkmode&sanitize=true" align=middle width=724.0578641999999pt height=22.831056599999986pt/>I(t = 0) = 1<img src="/Exercises/tex/a132815b0ed1b5561f9395ab20e29cb5.svg?invert_in_darkmode&sanitize=true" align=middle width=205.53833354999998pt height=22.831056599999986pt/><img src="/Exercises/tex/5b7054e279bb5679177c17a7ab787171.svg?invert_in_darkmode&sanitize=true" align=middle width=251.32969455pt height=24.65753399999998pt/><img src="/Exercises/tex/fd92a53167b3c6ae9574071613d555dc.svg?invert_in_darkmode&sanitize=true" align=middle width=27.11199479999999pt height=22.831056599999986pt/><img src="/Exercises/tex/e8741fa4d6ee2dd1e2c39fac632c49ba.svg?invert_in_darkmode&sanitize=true" align=middle width=105.14631434999998pt height=21.18721440000001pt/><img src="/Exercises/tex/19260705a622317704d807b73775726c.svg?invert_in_darkmode&sanitize=true" align=middle width=587.0257239pt height=24.65753399999998pt/>km^2<img src="/Exercises/tex/6da5da68a72a0cc76a4d773cc0facb89.svg?invert_in_darkmode&sanitize=true" align=middle width=216.96363315pt height=24.65753399999998pt/>km^2<img src="/Exercises/tex/3ca72b3b92edfc02c19ec420f953fe58.svg?invert_in_darkmode&sanitize=true" align=middle width=700.27458765pt height=203.6529759pt/>S<img src="/Exercises/tex/24ee684c2922b0d32c54a34089c92ec0.svg?invert_in_darkmode&sanitize=true" align=middle width=4.5662248499999905pt height=14.15524440000002pt/>I<img src="/Exercises/tex/24ee684c2922b0d32c54a34089c92ec0.svg?invert_in_darkmode&sanitize=true" align=middle width=4.5662248499999905pt height=14.15524440000002pt/>R<img src="/Exercises/tex/177888d5a8464812dc589444e66f990f.svg?invert_in_darkmode&sanitize=true" align=middle width=1533.27102885pt height=45.84475500000001pt/>$\rho = a/r ~200$$





## Cathedral exercise
------------------

What distinguishes our cathedral from all other German Gothic
cathedrals?
