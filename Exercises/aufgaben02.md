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

````julia
using DifferentialEquations, Plots, ParameterizedFunctions
sir_ode = @ode_def begin
  dS = - r * S * I 
  dI =   r * S * I - a * I 
  dR = a *  I
end r a


u0 = [450 550 0.]
p  = [0.1 50]

prob = ODEProblem(sir_ode, u0, 1., p)
sol = solve(prob)

plot(sol)
````


![](figures/aufgaben02_solution_1_1.png)



* Plot the solutions in configuration space.
    * Plotting documentation: [DifferentialEquations](http://docs.juliadiffeq.org/latest/basics/plot.html) and [Plots](http://docs.juliaplots.org/latest/).
    * Helpful arguments for the plot function: `vars`, `seriestype`, `linestyle`

* Solve the ode for <img src="/Exercises/tex/b855a403df9beca82ce842e87641d959.svg?invert_in_darkmode&sanitize=true" align=middle width=155.81819549999997pt height=21.18721440000001pt/> and plot the solution in phase space for the variables <img src="/Exercises/tex/e257acd1ccbe7fcb654708f1a866bfe9.svg?invert_in_darkmode&sanitize=true" align=middle width=11.027402099999989pt height=22.465723500000017pt/> and <img src="/Exercises/tex/21fd4e8eecd6bdf1a4d3d6bd1fb8d733.svg?invert_in_darkmode&sanitize=true" align=middle width=8.515988249999989pt height=22.465723500000017pt/>. Interpret the plot.

````julia
r_vec = [0.1:0.05:0.5...]
plot()
for r in r_vec
  p[1] = r
  prob = ODEProblem(sir_ode, u0, 1., p)
  sol = solve(prob)
  display(plot!(sol, vars = (1,2), label = "r = <img src="/Exercises/tex/816e7ee822c70930ab2327c37b7e73bd.svg?invert_in_darkmode&sanitize=true" align=middle width=2521.1416427999998pt height=85.29680940000001pt/>I(t = 0) = 1<img src="/Exercises/tex/8525b04e0964194bd0732a483702135f.svg?invert_in_darkmode&sanitize=true" align=middle width=840.6123841499999pt height=47.671232400000015pt/>r"))
end
````


![](figures/aufgaben02_solution_3_1.png)
![](figures/aufgaben02_solution_3_2.png)
![](figures/aufgaben02_solution_3_3.png)
![](figures/aufgaben02_solution_3_4.png)
![](figures/aufgaben02_solution_3_5.png)
![](figures/aufgaben02_solution_3_6.png)
![](figures/aufgaben02_solution_3_7.png)
![](figures/aufgaben02_solution_3_8.png)
![](figures/aufgaben02_solution_3_9.png)


* Simulate the SIR model for <img src="/Exercises/tex/5b7054e279bb5679177c17a7ab787171.svg?invert_in_darkmode&sanitize=true" align=middle width=251.32969455pt height=24.65753399999998pt/> and <img src="/Exercises/tex/e8741fa4d6ee2dd1e2c39fac632c49ba.svg?invert_in_darkmode&sanitize=true" align=middle width=105.14631434999998pt height=21.18721440000001pt/>. What difference would you expect for an epidemic in Manhattan (27.500 citizens per <img src="/Exercises/tex/bf0a194b9b51caa4bb09d3ea9a96b97a.svg?invert_in_darkmode&sanitize=true" align=middle width=30.06101009999999pt height=26.76175259999998pt/>) and Mongolia (1,7 citizens per <img src="/Exercises/tex/bf0a194b9b51caa4bb09d3ea9a96b97a.svg?invert_in_darkmode&sanitize=true" align=middle width=30.06101009999999pt height=26.76175259999998pt/>)?

````julia
# No outbreak for low density of susceptible subjects
S_vec = 10 .^[2:0.2:3...]
p1 = plot()
p2 = plot()
p3 = plot()
for S in S_vec
  u0 = [S 50 0.]
  p = [0.1 10]
  prob = ODEProblem(sir_ode, u0, 1., p)
  sol = solve(prob)
  plot!(p1, sol, vars = 1, label = "")
  plot!(p2, sol, vars = 2, label = "")
  plot!(p3, sol, vars = 3, label = "")
end
plot(p1,p2,p3, layout = 3)
````


![](figures/aufgaben02_solution_4_1.png)




## Exercise 2: Schoolboys dataset

In this exercise, we are going to model the influenza outbreak at the english boarding school in 1978 with the standard SIR model.

1. Find the data in `Data/schoolboys.csv` and plot the number of sick boys vs time
1. From the data, obtain suitable initial conditions `u0` for <img src="/Exercises/tex/e257acd1ccbe7fcb654708f1a866bfe9.svg?invert_in_darkmode&sanitize=true" align=middle width=11.027402099999989pt height=22.465723500000017pt/>, <img src="/Exercises/tex/21fd4e8eecd6bdf1a4d3d6bd1fb8d733.svg?invert_in_darkmode&sanitize=true" align=middle width=8.515988249999989pt height=22.465723500000017pt/>, <img src="/Exercises/tex/1e438235ef9ec72fc51ac5025516017c.svg?invert_in_darkmode&sanitize=true" align=middle width=12.60847334999999pt height=22.465723500000017pt/> and define `tspan` accordingly.
1. Define the parameter vector `p` with guessed parameters
1. Solve the ODE problem and plot it together with data. Does it fit?
1. Play around with the parameters to obtain a better model fit.
    * From the Lecture script, p. 42: $$\rho = a/r ~200$$





## Cathedral exercise

Close to the outside staircase leading to the top panorama platform there are seven huge figures.
During the renovation around 1900 one of the figures was replaced by a figure of the Canon.
What about this fact was so funny for a church representative from Konstanz when he visited
the inauguration ceremony after the renovation?
