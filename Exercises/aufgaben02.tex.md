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

To solve an ODE, first pose the complete ODE problem

```
function ode(u,p,t)
  ...
  return(du)
end
```




## Exercise 1: SIR-Models

[o] Define the SIR ODE with the Macro-thing
[] Collect all necessary information to solve the following ODE describing the spread of an infectious disease in a population

* Use the parameters (from Christian, a little )
* tune the parameters to make the model fit better

[] install the needed packages
[] Integrate the ODE with DifferentialEquations.jl
[] Play around with it a little
[] Fit the data to the data from the outbreaks paper: -> too ambitious? http://www.repidemicsconsortium.org/outbreaks/reference/influenza_england_1978_school.html


## Cathedral exercise
------------------

What distinguishes our cathedral from all other German Gothic
cathedrals?
