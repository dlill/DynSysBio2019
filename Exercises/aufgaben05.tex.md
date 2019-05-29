Dynamical Systems in Biology 
============================


Exercise 1: Enzyme dynamics
---------------------------

Implement the enzyme reaction

$$
\begin{aligned} 
S + E 
{{k_{ 1} \atop \longrightarrow} \atop {\longleftarrow \atop k_{-1}}} 
C \stackrel{k_2}{\longrightarrow} 
P + E. 
\end{aligned} 
$$

-   using mass action kinetics:

$$ 
\begin{aligned} 
\dot{s} & = k_{-1} \cdot c - k_1 s \cdot e \\ 
\dot{e} & = (k_{-1} + k_2) \cdot c - k_1 \cdot s \cdot e \\ 
\dot{c} & = k_1 \cdot s \cdot e - (k_{-1} + k_2) \cdot c \\ 
\dot{p} & = k_2 \cdot c, 
\end{aligned}
$$

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

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = -\frac{k_2 e_{T}\cdot s}{\frac{k_{-1}}{k_1}} + s} \\ 
c & = \frac{e_{T} \cdot s}{\frac{k_{-1}}{k_1} + s} \\
e &= e_T - c. 
\end{aligned} 
$$

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

$$ 
\begin{aligned} 
\dot{s} & = - \dot{p} = - \frac{k_2 e_{T} \cdot s}{K_m + s} \\ 
c & = \frac{e_{T} \cdot s}{K_m + s} 
e &= e_T - c
\quad \text{with} \quad K_m = \frac{k_{-1} + k_2}{k_1} 
\end{aligned}
$$

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






-   Simulate the three dynamic systems with parameters $(k_1 = 0.1)$, $(k_{-1} = 0.1)$, and $(k_2 = 0.1)$. 
Let the initial concentrations be $(e(0) = 10)$, $(c(0) = 0)$, 
and $(s(0) = 10, 20, ..., 100)$. 

-   Take a closer look at the initial time frame of the full system
    implemented by mass-action kinetics. What do you observe?

-   Have a look at the dynamics of all implementations in phase space $(s)$ vs. $(c)$.






Cathedral exercise:
-------------------

On the historic depiction of the cathedral on a control box in front of
the Hof-Apotheke, corner KaJo / Münsterstrasse, one can see that four
steps lead to the main portal of the minster. Why is it only one today?

