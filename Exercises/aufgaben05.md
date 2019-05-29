Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

<p align="center"><img src="/Exercises/tex/ebbb92b4fc654e56924c810ec5759384.svg?invert_in_darkmode&sanitize=true" align=middle width=173.5165806pt height=46.36403144999999pt/></p>

-   using mass action kinetics:

<p align="center"><img src="/Exercises/tex/f18680f89433340961ebba8cf3aa58dd.svg?invert_in_darkmode&sanitize=true" align=middle width=199.3163667pt height=88.58448225pt/></p>

````julia

using DifferentialEquations
using Plots
````


````julia

function ek_ma_ode!(du, u, p, t)
    # p = [kon koff kcat]
    du[1] = - p[1] * u[1] * u[2] + p[2] * u[3] #s
    du[2] = - p[1] * u[1] * u[2] + (p[2] + p[3]) * u[3] #e
    du[3] =   p[1] * u[1] * u[2] - (p[2] + p[3]) * u[3] #c
    du[4] = p[3]*u[3] #p
    return(du)
end

u0_ma = [10. 10 0 0]'
p = ones(3)  * 0.1
du = zeros(4)
tspan = (0.,60.)
ek_ma_ode!(du, u0_ma, p, 1)
ek_ma_prob = ODEProblem(ek_ma_ode!, u0_ma, tspan, p)
ek_ma_sol = solve(ek_ma_prob)
plot(ek_ma_sol)
````





-   using the steady-state approximation:

<p align="center"><img src="/Exercises/tex/2ad00bf15ed38c11695f1224a4b8dd61.svg?invert_in_darkmode&sanitize=true" align=middle width=170.64354285pt height=113.59650719999999pt/></p>

````julia

function ek_ss_ode!(du, u, p, t)
    # p = [kon koff kcat eT]
    # u = [s p]
    du[1] =  - p[3] * p[4] * u[1] / (p[2]/p[1] + u[1])
    du[2] =  + p[3] * p[4] * u[1] / (p[2]/p[1] + u[1])
    return(du)
end

u0_ss = [10. 0]'
p = push!(ones(3)  * 0.1, 10)
du_ss = zeros(2)
tspan = (0.,60.)
ek_ss_ode!(du_ss, u0_ss, p, 1)
ek_ss_prob = ODEProblem(ek_ss_ode!, u0_ss, tspan, p)
ek_ss_sol = solve(ek_ss_prob)
plot(ek_ss_sol)
````



-   using the quasi-steady state approximation:

<p align="center"><img src="/Exercises/tex/e3b6c75b8f59c1daab092e4eb5e6d5ae.svg?invert_in_darkmode&sanitize=true" align=middle width=399.98491664999995pt height=79.1309904pt/></p>

````julia

function ek_qs_ode!(du, u, p, t)
    # p = [kon koff kcat eT]
    # u = [s p]
    du[1] =  - p[3] * p[4] * u[1] / ((p[2]+p[3])/p[1] + u[1])
    du[2] =  + p[3] * p[4] * u[1] / ((p[2]+p[3])/p[1] + u[1])
    return(du)
end

u0_qs = [10. 0]'
p = push!(ones(3)  * 0.1, 10)
du_qs = zeros(2)
tspan = (0.,60.)
ek_qs_ode!(du_qs, u0_qs, p, 1)
ek_qs_prob = ODEProblem(ek_qs_ode!, u0_qs, tspan, p)
ek_qs_sol = solve(ek_qs_prob)
plot(ek_qs_sol)

function ce_qs(sp_sol,p,t)
    c = zeros(length(t))
    e = zeros(length(t))
    @. c = p[4] * (sp_sol(t, idxs = 1)) / ((p[2]+p[3])/p[1] + sp_sol(t, idxs = 1))
    @. e = p[4] - c
    [t c e]
end
complexes = ce_qs(ek_qs_sol, p, collect(0:0.1:60))
plot!(complexes[:,1], complexes[:,2:3])
````






-   Simulate the three dynamic systems with parameters <img src="/Exercises/tex/13f4a5e304e36b9bef73a21d70eda5ab.svg?invert_in_darkmode&sanitize=true" align=middle width=71.64004319999998pt height=24.65753399999998pt/>, <img src="/Exercises/tex/17f7bc0a246c0007404a5346ae28b839.svg?invert_in_darkmode&sanitize=true" align=middle width=81.91404044999999pt height=24.65753399999998pt/>, and <img src="/Exercises/tex/d4a645697d2f7de7f18500c8f4807ac4.svg?invert_in_darkmode&sanitize=true" align=middle width=71.64004319999998pt height=24.65753399999998pt/>. 
Let the initial concentrations be <img src="/Exercises/tex/41985d8d2961f0dfcc045f024feb26ca.svg?invert_in_darkmode&sanitize=true" align=middle width=79.80026339999999pt height=24.65753399999998pt/>, <img src="/Exercises/tex/f73f55c4023713b093831c4f7116b881.svg?invert_in_darkmode&sanitize=true" align=middle width=71.04072029999999pt height=24.65753399999998pt/>, 
and <img src="/Exercises/tex/aa5ea4eca4ca023578e49439d7758c3e.svg?invert_in_darkmode&sanitize=true" align=middle width=156.56397404999998pt height=24.65753399999998pt/>. 

-   Take a closer look at the initial time frame of the full system
    implemented by mass-action kinetics. What do you observe?

-   Have a look at the dynamics of all implementations in phase space <img src="/Exercises/tex/04c429e9e93ade50366c838485173e34.svg?invert_in_darkmode&sanitize=true" align=middle width=20.49091274999999pt height=24.65753399999998pt/> vs. <img src="/Exercises/tex/bd972c06c10dc1121597b5779d02eb90.svg?invert_in_darkmode&sanitize=true" align=middle width=19.89923759999999pt height=24.65753399999998pt/>.






Cathedral exercise:
-------------------

On the historic depiction of the cathedral on a control box in front of
the Hof-Apotheke, corner KaJo / Münsterstrasse, one can see that four
steps lead to the main portal of the minster. Why is it only one today?

